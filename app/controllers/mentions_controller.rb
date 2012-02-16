class MentionsController < ApplicationController
  respond_to :html
  respond_to :json, :except => [:new, :create]
  def index

    @mentions = Mention.all
    respond_with Mention.all

  end

  def new
    @mention = Mention.new
    render :aciton => 'new'
  end

  def create
#    respond_with Mention.create(params[:mention])
    @mention = Mention.new(params[:mention])
    if @mention.save
      redirect_to mentions_url, :notice => "Successfully created mention."
    else
      render :action => 'new'

    end
  end

  def edit
    @mention = Mention.find(params[:id])
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
