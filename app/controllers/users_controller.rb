class UsersController < ApplicationController
  def profile
    @user = current_user
  end
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> commit from master

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

<<<<<<< HEAD
>>>>>>> setting avatar for user and icon for tech
=======
=======
>>>>>>> 993bdb0... rubocop changes
>>>>>>> commit from master
end
