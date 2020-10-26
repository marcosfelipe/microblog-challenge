class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    friendships = current_user.friends
    render json: friendships.to_json
  end

  def create
    current_user.friends << User.find(params[:friend_id])
    render json: current_user.friends.to_json
  end

  def destroy
    current_user.friends.destroy(params[:friend_id].to_i)
    render json: current_user.friends.to_json
  end
end
