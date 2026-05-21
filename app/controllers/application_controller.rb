class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!
  helper_method :current_user

  private

  def authenticate_user!
    redirect_to "/login" unless current_user
  end

  def current_user
    return @current_user if defined?(@current_user)

    token = cookies[:s_token]
    return @current_user = nil unless token.present?

    session = Session.find_active_by_key(token)
    return @current_user = nil unless session.present?

    @current_user = Auth.find_by(username: session.user)
  end
end