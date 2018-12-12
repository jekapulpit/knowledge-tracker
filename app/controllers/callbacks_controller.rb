class CallbacksController < Devise::OmniauthCallbacksController

  def vkontakte
    @user = User.from_omniauth_vk(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'Vkontakte') if is_navigational_format?
    else
      session['devise.vkontakte_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

end