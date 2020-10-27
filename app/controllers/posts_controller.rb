class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = current_user.posts.new(post_params)
    if post.save
      render json: post.to_json(methods: :user)
    else
      render json: { errors: post.errors }, status: :bad_request
    end
  end

  def index
    posts = current_user.posts.order(created_at: :desc)
    render json: posts.to_json(methods: :user)
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    head :no_content
  end

  private

  def post_params
    params.require(:post).permit :content
  end
end
