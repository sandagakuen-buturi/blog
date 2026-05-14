class InviteMailer < ApplicationMailer
  def invite_email(invite)
    invite = params[:invite]
    url = "#{ENV['FRONTEND_URL']}/register?token=#{invite.token}"

    params = {
      from: "#{ENV['RESEND_FROM_NAME']} <#{ENV['RESEND_FROM_EMAIL']}>",
      to: invite.email,
      subject: "You're invited to join Buturibu Blog Service",
      text: "You have been invited to join our platform. Please click the link below to register:\n\n#{url}\n\n\n\nSend from Buturibu Blog Service"
    }
    Resend::Emails.send(params)
  end
end
