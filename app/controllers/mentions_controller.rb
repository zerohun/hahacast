class MentionsController < ApplicationController
  respond_to :html
  respond_to :mobile, :only => :new
  respond_to :json, :except => [:new, :create]
  before_filter :authenticate_user!, :except => [:index]
  load_and_authorize_resource

  def index
    usercast = Usercast.where(:id => params[:usercast_id]).first
    @mentions = usercast.tree_sorted_mentions
    respond_with @mentions
  end


  def new
    @mention = current_user.mentions.build(:parent_id => params[:parent_id], 
                                           :usercast_id => params[:usercast_id])
    authorize_create_mention!(@mention.usercast)
    gon.parent_id = params[:parent_id] if params[:parent_id]
    gon.usercast_id = @mention.usercast_id 
    gon.auth_token = current_user.authentication_token
    render :aciton => 'new'
  end

  def create
#    respond_with Mention.create(params[:mention])
    @mention = current_user.mentions.build(params[:mention])
    authorize_create_mention!(@mention.usercast)
    if @mention.save
      notification = @mention.create_notification!
      user_friends = @mention.user.matched_friends
      if user_friends.present?
        user_friends.each do |friend|
          friend.notifications << notification
        end
      end
      usercast_friends = @mention.usercast.user.matched_friends
      if usercast_friends.present?
        usercast_friends.each do |friend|
          friend.notifications << notification
        end
      end
      redirect_to @mention.usercast, :notice => "Successfully created mention."
    else
      render :action => 'new'

    end
  end

  def edit
#    @mention = Mention.find(params[:id])
  end

  def update
    #@mention = Mention.find(params[:id])
    #if @mention.update_attributes(params[:mention])
      #redirect_to mentions_url, :notice  => "Successfully updated mention."
    #else
      #render :action => 'edit'
    #end
    respond_with Mention.destory(params[:id])
  end

  def show
    @mention = Mention.where(:id => params[:id]).first
    @root_mention = @mention.root
  end

end
