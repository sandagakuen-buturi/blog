class Auth < ApplicationRecord
  public
  def create_session(expires_in: 24.hours)
    token = SecureRandom.hex(16)
    Session.create(user: self.id, token: token, expires_at: Time.now + expires_in)
  end
end
