require 'test_helper'

class TimelineControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index' do
    sign_in users(:one)
    get timeline_index_path, as: :json
    assert_response :success
  end
end
