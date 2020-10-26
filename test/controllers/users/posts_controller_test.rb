require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get user_posts_path(users(:one)), as: :json
    assert_response :success
  end
end
