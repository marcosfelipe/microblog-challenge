require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should be valid' do
    post = Post.new(content: 'new content.', user: users(:one))
    assert_equal true, post.valid?
  end
end
