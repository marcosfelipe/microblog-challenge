class Users::PostsController < ApplicationController
  def index
    posts = User.find(params[:user_id]).posts.order(created_at: :desc)
    render json: posts.to_json(methods: :user)
  end
end
