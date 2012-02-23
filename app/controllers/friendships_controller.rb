class FriendshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    user = User.find_by_id(params[:user_id])
    friendship = user.friendships.build(:friend_id => params[:friend_id])
    if friendship.save
      flash[:message] = "friend request is made successfully"
    else
      flash[:message] = "friend request is failed"
    end
    redirect_to usercasts_path
  end

  def destroy
    friendship = Friendship.find_by_id(params[:id])
    friendship.destroy
    redirect_to usercasts_path
  end
end
