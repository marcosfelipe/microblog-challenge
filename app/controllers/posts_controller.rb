class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = current_user.posts.new(post_params)
    if post.save
      render json: post.to_json
    else
      render json: { errors: post.errors }, status: :bad_request
    end
  end

  private

  def post_params
    params.require(:post).permit :content
  end
end
