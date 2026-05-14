class Api::LoginController < ApiApplicationController
  def create
    username = params[:username]
    password = params[:password].to_s
    hashed_password = Digest::SHA256.hexdigest(password)
    user = Auth.find_by(username: username, password_hashed: hashed_password)

    if user.nil?
      render json: { error: true, message: "Invalid username or password" }, status: :unauthorized
      return
    end

    session = user.create_session
    render json: { token: session.token, expires_at: session.expires_at }
  end
end
