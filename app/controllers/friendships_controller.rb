class FriendshipsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @friendships = Friendship.find_by_user_id(current_user.id)
    @inverse_friendships = Friendship.find_by_friend_id(current_user.id) 
  end

  def create
    user = User.find_by_id(params[:user_id])
    friendship = user.friendships.build(:friend_id => params[:friend_id])
    friendship.create_new
    if friendship.matched_inverse.present?
      friendship.matched = true
      friendship.matched_inverse.matched = true
      friendship.matched_inverse.save
    end

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
