class TimelineController < ApplicationController
  before_action :authenticate_user!

  def index
    user_ids = current_user.friends.pluck(:id)
    user_ids << current_user.id
    posts = Post.by(user_ids).order(created_at: :desc)
    render json: posts.to_json(methods: :user)
  end
end
