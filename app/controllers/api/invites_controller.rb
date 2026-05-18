class Api::InvitesController < ApiApplicationController
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

  def index
    render json: ApiApplicationHelper::Response.ok(message: "index hello")
  end

  def create

  end
end
