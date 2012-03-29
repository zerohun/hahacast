class FriendshipsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html
  respond_to :json

  def index
#    @friendships = Friendship.where(:id => current_user.id)
    @inverse_friendships = Friendship.where(:id => current_user.id, :matched => true)
    respond_with @inverse_friendships
  end

  def create
    user = User.find_by_id(params[:user_id])
    friendship = user.friendships.build(:friend_id => params[:friend_id])
    if friendship.matched_inverse.present?
      friendship.matched = true
      friendship.matched_inverse.matched = true
      friendship.matched_inverse.save
    end

    if friendship.save 
      friendship.create_new!
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
