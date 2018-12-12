class UsersController < ApplicationController
  def profile
    @user = current_user
  end
<<<<<<< HEAD
=======

  def create

  end

  def update

  end

  def delete

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :lang, :avatar)
  end

>>>>>>> setting avatar for user and icon for tech
end
