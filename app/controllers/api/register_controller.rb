class Api::RegisterController < ApiApplicationController
  def create
    email = params[:email]
    if Invite.exists?(email: email)
      res = ApiApplicationHelper::Response.success(message: "Invite found for email")
      render json: res, status: :unprocessable_entity
      return
    end

    begin
      invite = Invite.create_invite(email)
      result = InviteMailer.with(invite).invite_email
      if result.is_a?(Net::HTTPOK)
        res = ApiApplicationHelper::Response.success(message: "Invite email sent successfully")
        render json: res
      else
        res = ApiApplicationHelper::Response.error(message: "Failed to send invite email")
        render json: res, status: :internal_server_error
      end
    rescue Error => e
      p e
      res = ApiApplicationHelper::Response.error(message: "Failed to create invite", data: {
        error: e.message
      })
      render json: res, status: :internal_server_error
    end
  end
end
