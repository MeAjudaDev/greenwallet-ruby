require "test_helper"

class UsersSharedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_shareds_index_url
    assert_response :success
  end
end
