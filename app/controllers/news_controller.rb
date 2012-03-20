class NewsController < ApplicationController

  respond_to :html
  respond_to :json
  def index
    @news = New.all
    respond_with @news
  end
end
