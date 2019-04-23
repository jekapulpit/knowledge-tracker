class Api::UsersController < ApplicationController
  def profile
    user = current_user.with_all_attributes
    progress = current_user.technologies_users.includes(:technology)
    render json: { trackingTechnologies: progress, user: user }
  end

  def create; end

  def update; end

  def delete; end

  def change_avatar
    current_user.avatar.attach(params[:new_avatar])

    respond_to do |format|
      format.json { render json: { avatar: url_for(current_user.avatar) } }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :lang, :avatar)
  end
end
