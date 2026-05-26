# frozen_string_literal: true

class ApiApplicationController < ActionController::API
  include ActionController::MimeResponds
  before_action :auth_middleware

  private
  def auth_middleware
    begin
    auth_header = request.headers["Authorization"]
    unless auth_header.present? && auth_header.start_with?("Bearer ")
      return render json: ApiApplicationHelper::Response.unauthorized, status: :unauthorized
    end

    token = auth_header.split(" ").last
    session = Session.find_active_by_key(token)
    unless session
      return render json: ApiApplicationHelper::Response.unauthorized, status: :unauthorized
    end

    user = Auth.find_by(username: session.user)
    unless user
      return render json: ApiApplicationHelper::Response.unauthorized, status: :unauthorized
    end
    @current_user = user
    rescue Exception => e
      return render json: ApiApplicationHelper::Response.error(message: "Authentication error", data: {
        error: e.message
      }), status: :internal_server_error
    end
  end
end
