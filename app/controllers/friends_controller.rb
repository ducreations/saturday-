class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = Friend.all
  end

  def new
    @friend = Friend.new
  end

  def create 
    @friend = Friend.new(params.require(:friend).permit(:name, :user_id))
    if @friend.save
      redirect_to friends_path, notice: "Friend successfully added"
    else
      render :new
    end
  end

  def destroy
    @friend = Friend.destroy(params[:id])
    if @friend.destroy
      redirect_to friends_path, alert: "Friend removed"
    end
  end
end
