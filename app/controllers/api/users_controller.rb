class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def profile
    user = current_user.with_all_attributes
    progress = current_user.progress
    render json: { trackingTechnologies: progress, user: user }
  end

  def create; end

  def update; end

  def delete; end

  def change_avatar
    current_user.avatar.attach(params[:new_avatar])
    render json: {avatar: url_for(current_user.avatar)}
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :lang, :avatar)
  end
end
