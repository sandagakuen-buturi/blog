class Public::Api::InvitesController < ApiApplicationController
  def show
    token = params[:id]
    invite = Invite.find_valid_invite(token)
    if invite.nil?
      render json: ApiApplicationHelper::Response.not_found(message: "Invalid or expired invite token", data: {
        token: token
      }), status: :not_found
      return
    end

    render json: ApiApplicationHelper::Response.ok(message: "#{id} hello")
  end

  def create
    email = params[:email]

    begin
      invite = Invite.create_invite(email)
      render json: ApiApplicationHelper::Response.ok(message: "Invite created", data: {
        invite: invite
      })
    rescue Error => e
      render json: ApiApplicationHelper::Response.error(message: "Failed to create invite", data: {
        error: e.message
      }), status: :internal_server_error
    end
  end
end
