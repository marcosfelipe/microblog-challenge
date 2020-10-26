require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup { sign_in users(:one) }

  test 'should create a post' do
    assert_difference 'Post.count' do
      post posts_path, as: :json, params: { post: { content: 'new post!' } }
    end
    assert_response :success
  end
end
