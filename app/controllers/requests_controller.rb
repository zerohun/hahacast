class RequestsController < ApplicationController
  def index
    @requests = current_user.received_friend_requests
    gon.current_user = current_user
  end
end
