require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get root as anonymous' do
    get root_path
    assert_response :success
  end

  test 'should get root as logged user' do
    sign_in users(:one)
    get root_path
    assert_response :success
  end
end
