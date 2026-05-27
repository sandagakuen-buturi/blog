class Api::LoginController < ApiApplicationController
  def create
    username = params[:username]
    password = params[:password].to_s
    hashed_password = Digest::SHA256.hexdigest(password)
    user = Auth.find_by(username: username, password_hashed: hashed_password)

    if user.nil?
      return render json: ApiApplicationHelper::Response.not_found(message: "user not found"), status: :unauthorized
    end

    session = user.create_session
    if session.nil?
      render json: ApiApplicationHelper::Response.error(message: "Failed to create session"), status: :internal_server_error
    else
      render json: ApiApplicationHelper::Response.ok(data: { session_token: session.token })
    end
  end
end
