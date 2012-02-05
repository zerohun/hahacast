class MentionsController < ApplicationController
  def index
    @mentions = Mention.all
  end

  def new
    @mention = Mention.new
  end

  def create
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
    @mention = Mention.find(params[:id])
    if @mention.update_attributes(params[:mention])
      redirect_to mentions_url, :notice  => "Successfully updated mention."
    else
      render :action => 'edit'
    end
  end
end
