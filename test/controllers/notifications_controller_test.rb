require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index' do
    sign_in users(:one)
    get notifications_path, as: :json
    assert_response :success
  end
end
