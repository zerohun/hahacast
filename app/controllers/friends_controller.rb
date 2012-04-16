class FriendsController < ApplicationController
  def index
    @friends = current_user.matched_friends
  end
end
