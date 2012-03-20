class FriendsController < ApplicationController
  respond_to :html
  respond_to :json
  def index
    @friends = current_user.matched_friends
    respond_with @friends
  end
end
