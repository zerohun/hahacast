class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def facebook
    env = request.env["omniauth.auth"]
#    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    @user = User.find_by_facebook_uid(env["uid"])
    if @user.present?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      redirect_to mentions
#      sign_in_and_redirect @user, :event => :authentication
    else

      if current_user.present?
        current_user.facebook_uid = env["uid"]
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
