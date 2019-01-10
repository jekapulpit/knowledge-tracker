class UsersController < ApplicationController
  def profile
    @progress = current_user.technologies_users.includes(:technology)
    @passed_tests = current_user.test_results.where(result: 10).pluck(:test_id).uniq.count
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
