class UsersController < ApplicationController
  def index
    render json: User.all.to_json
  end

  def show
    render json: User.find(params[:id]).to_json(methods: [:following, :followers])
  end
end
