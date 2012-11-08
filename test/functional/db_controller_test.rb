require 'test_helper'

class DbControllerTest < ActionController::TestCase
  test "should get process_list" do
    get :process_list
    assert_response :success
  end

end
