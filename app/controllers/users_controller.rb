class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end


  def disconnect_with_facebook
    user = User.find_by_id(params[:id])
    user.facebook_uid = nil
    if user.save
      redirect_to user
    else
      throw "disconnect user to facebook is failed"
    end
  end
end
