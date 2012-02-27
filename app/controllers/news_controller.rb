class NewsController < ApplicationController
  def index
    @news = New.all
  end
end
