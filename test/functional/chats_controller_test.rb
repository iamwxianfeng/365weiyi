require 'test_helper'

class ChatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
