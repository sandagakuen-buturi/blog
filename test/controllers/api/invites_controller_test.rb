require "test_helper"

class Api::InvitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_invites_index_url
    assert_response :success
  end

  test "should get create" do
    get api_invites_create_url
    assert_response :success
  end
end
