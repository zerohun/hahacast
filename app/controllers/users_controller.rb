class UsersController < ApplicationController
  before_filter :authenticate_user!
  #def edit
    #@user = User.find(params[:id])
    #if current_user != @user
      #throw "you have no access to this page"
    #end
  #end

  #def update
    #@user = User.find(params[:id])
    #if @user.update_attributes(params[:user])
      #redirect_to '/', :notice  => "Successfully updated mention."
    #else
      #render :action => 'edit'
    #end
  #end
  def show
    @user = User.find(params[:id])
  end


  def disconnect_with_facebook
    user = User.find_by_id(params[:id])
    user.authconnections.find_by_provider("facebook").destroy

    if user.save
      redirect_to "/"
    else
      throw "disconnect user to facebook is failed"
    end
  end
end
