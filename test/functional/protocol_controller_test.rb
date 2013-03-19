require 'test_helper'

class ProtocolControllerTest < ActionController::TestCase
  test "should get detect" do
    get :detect
    assert_response :success
  end

  test "should get force_ssl" do
    get :force_ssl
    assert_response :success
  end

end
