class MentionsController < ApplicationController
  respond_to :html
  respond_to :json, :except => [:new, :create]
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :destroy]
  before_filter :assure_to_have_a_profile
  load_and_authorize_resource
  def index
    @mentions = Mention.roots
    respond_with @mentions
  end

  def new
    @mention = current_user.mentions.build(:parent_id => params[:parent_id])
    @parent_id = params[:parent_id]
    render :aciton => 'new'
  end

  def create
#    respond_with Mention.create(params[:mention])
    @mention = current_user.mentions.build(params[:mention])
    @mention.create_new
    if @mention.save
      redirect_to mentions_url, :notice => "Successfully created mention."
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
end
