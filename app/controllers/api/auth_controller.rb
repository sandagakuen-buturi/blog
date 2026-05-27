class Api::AuthController < ApiApplicationController
  def index
    if @current_user
      safe_user = `@current_user.as_json.except`("password_hashed")
      render json: ApiApplicationHelper::Response.ok(data: safe_user)
    else
      render json: ApiApplicationHelper::Response.unauthorized, status: :unauthorized
    end
  end
end
