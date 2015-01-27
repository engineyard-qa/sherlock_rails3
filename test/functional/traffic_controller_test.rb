require 'test_helper'

class TrafficControllerTest < ActionController::TestCase
  test "should get long_running_action" do
    get :long_running_action
    assert_response :success
  end

end
