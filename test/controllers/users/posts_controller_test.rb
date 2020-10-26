require 'test_helper'

class Users::PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get user_posts_path(users(:one)), as: :json
    assert_response :success
  end
end
