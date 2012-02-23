class UsercastsController < ApplicationController
  respond_to :html, :json
  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find_by_id(params[:id])
    throw "no user is found"if @user.blank?
    @mentions = @user.mentions.roots
    respond_with @mentions
  end
end
