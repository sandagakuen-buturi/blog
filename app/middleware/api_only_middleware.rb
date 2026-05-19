# frozen_string_literal: true

class ApiOnlyMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)
    unless env["PATH_INFO"].start_with?("/api")
      return @app.call(env)
    end

    auth_header = env["HTTP_AUTHORIZATION"]
    return [
      401,
      { "Content-Type" => "application/json" },
      [ApiApplicationHelper::Response.unauthorized(message: "Invalid Authorization header").to_json]
    ] unless auth_header&.start_with?("Bearer ")

    token = auth_header.split(" ", 2).last
    return [
      401,
      { "Content-Type" => "application/json" },
      [ApiApplicationHelper::Response.unauthorized(message: "Missing Authorization header").to_json]
    ] if token.blank? || token.length > 4096

    session = Session.active.find_by(token: token)
    return [
      401,
      { "Content-Type" => "application/json" },
      [ApiApplicationHelper::Response.unauthorized(message: "Invalid or expired token").to_json]
    ] if session.nil?

    @app.call(env)
  end
end
