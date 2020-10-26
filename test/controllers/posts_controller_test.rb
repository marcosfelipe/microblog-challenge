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

  test 'should create a post given empty content' do
    sign_in users(:one)
    assert_no_difference 'Post.count' do
      post posts_path, as: :json, params: { post: { content: '' } }
    end
    assert_response :bad_request
  end

  test 'should not create a post as anonymus' do
    assert_no_difference 'Post.count' do
      post posts_path, as: :json, params: { post: { content: 'new post!' } }
    end
    assert_response :unauthorized
  end

  test 'should get index' do
    sign_in users(:one)
    get posts_path, as: :json
    assert_response :success
  end
end
