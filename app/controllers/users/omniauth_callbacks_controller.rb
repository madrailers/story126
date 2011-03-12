class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_twitter_oauth(env["omniauth.auth"], current_user)

    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      @user.save
      Rails.logger.warn @user.inspect
      sign_in_and_redirect @user, :event => :registration
    end
  end
end
