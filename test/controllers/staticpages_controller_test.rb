require 'test_helper'

class StaticpagesControllerTest < ActionController::TestCase
  test 'should get vystavy' do
    get :exhibitions
    assert_response :success
  end
end
