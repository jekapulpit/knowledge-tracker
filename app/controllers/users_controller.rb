class UsersController < ApplicationController

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :lang, :avatar)
  end

end
