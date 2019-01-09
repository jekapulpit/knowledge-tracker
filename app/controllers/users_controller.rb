class UsersController < ApplicationController
  def profile
    current_user.technologies.each { |technology| update_progress(technology) }
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

  def update_progress(technology)
    passed_tests = 0
    technology.tests.each do |test|
      max_result = current_user
                   .test_results
                   .find_by(test_id: test.id, result: 10)
      passed_tests += 1 if max_result
    end
    current_user
      .technologies_users
      .find_by(technology_id: technology.id)
      .update(progress: passed_tests * 100 / technology.tests.count)
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :lang, :avatar)
  end
end
