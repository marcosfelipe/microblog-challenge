require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index as anonymous' do
    get users_path
    assert_response :success
  end

  test 'should get index as logged user' do
    sign_in users(:one)
    get users_path
    assert_response :success
  end
end
