class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end



  def assure_to_have_a_profile
    if current_user.profile.blank?
      redirect_to new_profile_path
    end
  end
end
