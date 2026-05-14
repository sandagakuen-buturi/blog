require "test_helper"

class Api::RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_register_create_url
    assert_response :success
  end
end
