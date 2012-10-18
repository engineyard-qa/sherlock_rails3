require 'test_helper'

class EnvControllerTest < ActionController::TestCase
  test "should get vars" do
    get :vars
    assert_response :success
  end

  test "should get request" do
    get :request
    assert_response :success
  end

end
