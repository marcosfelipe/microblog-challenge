class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    friendships = current_user.friends
    render json: friendships.to_json
  end

  def create
    friend = User.find(params[:friend_id])
    current_user.friends << friend
    notification = current_user.notifications.create message: "#{current_user.username} followed you."
    UserChannel.broadcast_to friend, notification.message
    render json: current_user.friends.to_json
  end

  def destroy
    current_user.friends.destroy(params[:friend_id].to_i)
    render json: current_user.friends.to_json
  end
end
