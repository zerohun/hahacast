class UsercastsController < ApplicationController
  respond_to :html, :json
  def index
    @usercasts = Usercast.all
    respond_with @usercasts
  end

  def show
    @usercast = Usercast.where(:id => params[:id]).first
    @user = @usercast.user
    @mentions = @usercast.mentions.roots
    respond_with @usercast
  end
end
