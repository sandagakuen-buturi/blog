class Invite < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true

  class << self
    def create_invite(email)
      token = SecureRandom.hex(16)
      invite = Invite.create(email: email, token: token)
      InviteMailer.with(invite: invite).invite_email
      invite
    end

    def create_invites(emails)
      invites = []
      emails.each do |email|
        invite = create_invite(email)
        invites << invite if invite.persisted?
      end
      invites
    end

    def find_valid_invite(token)
      invite = find_by(token: token)
      return nil if invite.nil? || invite.expired?

      invite
    end
  end

  def expired?
    created_at < 7.days.ago
  end

  def accept!(username, password)
    return false if expired?

    transaction do
      digest = Digest::SHA256.hexdigest(password.to_s).to_s
      user = Auth.create!(username: username, password_hashed: digest)
      destroy!
      user
    end
  end

  def accept_with_user!(user)
    return false if expired?

    transaction do
      user.save!
      destroy!
      user
    end
  end

  def resend_invite
    return false if expired?

    result = InviteMailer.with(invite: self).invite_email
    if result.is_a?(Net::HTTPOK)
      update!(created_at: Time.now)
    else
      false
    end

    self
  end
end
