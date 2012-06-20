class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    env = request.env["omniauth.auth"]
#    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    auth_connection = Authconnection.find(:first, :conditions => {:provider => "facebook", :uid => env["uid"]})

    if auth_connection.present?
      user = auth_connection.user
      user = User.where(:facebook_uid => env["uid"]).first
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect user, :event => :authentication
    else
      if current_user.present?
        current_user.facebook_uid = env["uid"]
        current_user.authconnections.build(:provider => "facebook", :uid => env["uid"], :access_token => env["credentials"]["token"])
        logger.info "picture_info : " "http://graph.facebook.com/#{env['uid']}/picture"
        if current_user.profile.blank?
          current_user.create_profile(:picture => env["info"]["image"],
                                      :first_name =>env["info"]["first_name"],
                                      :last_name => env["info"]["last_name"]
                                     )
        elsif

          current_user.profile.picture = env["info"]["image"]
          current_user.profile.first_name = env["info"]["first_name"]
          current_user.profile.last_name = env["info"]["last_name"]
          current_user.profile.save
        end
        current_user.save!
        redirect_to '/'
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
      else
        render :failed_to_omniauth
      end
    end
  end
end
