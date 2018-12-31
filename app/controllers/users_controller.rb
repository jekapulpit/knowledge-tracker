class UsersController < ApplicationController
  def profile
    @progress_list = current_user.technologies_users.includes(:technology)
  end

  def create; end

  def update; end

  def delete; end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :lang, :avatar)
  end
end
