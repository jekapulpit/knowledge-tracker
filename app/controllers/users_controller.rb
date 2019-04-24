class UsersController < ApplicationController
  def profile; end

  def create; end

  def update; end

  def delete; end

  def change_avatar
    puts params[:new_avatar]
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
