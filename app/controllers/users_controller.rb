class UsersController < ApplicationController
  def profile
    @user = current_user
  end
<<<<<<< HEAD
=======

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :lang, :avatar)
  end

>>>>>>> setting avatar for user and icon for tech
end
