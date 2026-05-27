class Api::AuthController < ApplicationController
  def index
    if @current_user
      current_user = @current_user
      delete current_user.password_hashed
      render json: ApiApplicationHelper::Response.ok(data: current_user)
    else
      render json: ApiApplicationHelper::Response.unauthorized, status: :unauthorized
    end
  end
end
