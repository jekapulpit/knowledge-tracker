class TechnologiesUsersController < ApplicationController
  def destroy
    users_technology = TechnologiesUser.find(params[:id])
    authorize users_technology
    current_user.tests.where(technology: users_technology.technology).destroy_all
    users_technology.destroy

    redirect_to '/profile'
  end
end
