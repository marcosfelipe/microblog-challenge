require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index' do
    sign_in users(:one)
    get friendships_path, as: :json
    assert_response :success
  end

  test 'should create friendship' do
    sign_in users(:one)
    assert_difference('users(:one).friends.count') do
      post friendships_path, params: { friend_id: users(:two).id }, as: :json
    end
    assert_response :success
  end

  test 'should destroy friendship' do
    sign_in users(:one)
    users(:one).friends << users(:two)
    assert_difference('users(:one).friends.count', -1) do
      delete friendships_path, params: { friend_id: users(:two).id }, as: :json
    end
    assert_response :success
  end
end
