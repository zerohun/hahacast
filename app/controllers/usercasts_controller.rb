class UsercastsController < ApplicationController
  def index
    @usercasts = Usercast.all 
  end

  def edit
    @usercast = Usercast.where(:id => params[:id]).first
    @user = @usercast.user
  end

  def show
    @mention_id = params[:mention_id] || nil
    @usercast = Usercast.where(:id => params[:id]).first
    @user = @usercast.user
  end
end
