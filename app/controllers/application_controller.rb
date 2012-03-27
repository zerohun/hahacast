class ApplicationController < ActionController::Base
#  before_filter :assure_to_have_a_profile
  before_filter :prepare_for_mobile
  helper_method :can_create_mention_from
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  private
  def sort_by_depth_first(root_node)
    stack = []
    result = []
    stack << root_node
    begin
      cursor = stack.last
      result << cursor
      if cursor.has_children?
        stack = stack + cursor.children.reverse
      end
      stack.delete(cursor)
    end while stack.size > 0
    result
  end

  def assure_to_have_a_profile
    if current_user.present?
      if current_user.profile.blank?
        redirect_to new_profile_path
      end
    end
  end

  def can_create_mention_from?(usercast)
    #user should be friend with usercast's owner
    #user should be onwer of the usercast
    usercast.user == current_user or
    usercast.user.friends.include? current_user
  end

  def cannot_create_mention_from?(usercast)
    !(can_create_mention_from? usercast)
  end


  def authorize_create_mention!(usercast)
     if cannot_create_mention_from? usercast
       raise CanCan::AccessDenied
     end
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def prepare_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
      request.format = :mobile if mobile_device?
  end

end
