class Api::InvitesController < ApiApplicationController
  def show
    invite = Invite
    render json: ApiApplicationHelper::Response.ok(message: "#{id} hello")
  end

  def index
    render json: ApiApplicationHelper::Response.ok(message: "index hello")
  end

  def create

  end
end
