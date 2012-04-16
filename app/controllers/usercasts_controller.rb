class UsercastsController < ApplicationController
  def index
    @usercasts = Usercast.all 
  end

  def show
    @page_number = params[:page]
    @usercast = Usercast.where(:id => params[:id]).first
    @user = @usercast.user

    #@mentions = @usercast.tree_sorted_mentions
  end
end
