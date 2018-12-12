class UsersController < ApplicationController
  def profile
    @user = current_user
  end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> commit from master
=======
>>>>>>> rubocop changes 2.0

  def create; end

  def update; end

  def delete; end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :lang, :avatar)
  end
<<<<<<< HEAD

<<<<<<< HEAD
>>>>>>> setting avatar for user and icon for tech
=======
=======
>>>>>>> 993bdb0... rubocop changes
>>>>>>> commit from master
=======
>>>>>>> rubocop changes 2.0
end
