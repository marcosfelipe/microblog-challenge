require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create a post' do
    sign_in users(:one)
    assert_difference 'Post.count' do
      post posts_path, as: :json, params: { post: { content: 'new post!' } }
    end
    assert_response :success
  end

  test 'should not create a post as anonymus' do
    assert_no_difference 'Post.count' do
      post posts_path, as: :json, params: { post: { content: 'new post!' } }
    end
    assert_response :unauthorized
  end
end
