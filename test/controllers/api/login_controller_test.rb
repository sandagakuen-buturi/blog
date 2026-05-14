require "test_helper"

class Api::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_login_create_url
    assert_response :success
  end
end
