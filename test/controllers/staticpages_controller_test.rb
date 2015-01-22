require 'test_helper'

class StaticpagesControllerTest < ActionController::TestCase
  test "should get vystavy" do
    get :exhibitions
    assert_response :success
  end

  test "should get kdo_jsme" do
    get :about_us
    assert_response :success
  end

end
