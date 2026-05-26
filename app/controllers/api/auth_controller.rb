class Public::Api::AuthController < ApplicationController
  def index
    if current_user
      render json: {
        id: current_user.id,
        email: current_user.email,
        name: current_user.name,
        admin: current_user.admin?,
      }
    else
      render json: nil, status: :unauthorized
    end
  end
end
