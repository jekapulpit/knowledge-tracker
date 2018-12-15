class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
  end

  def edit
    @technology = Technology.find(params[:id])
  end

  def show
    @technology = Technology.find(params[:id])
  end

  def create; end

  def update
    @technology = Technology.find(params[:id])
    if @technology.update(technology_params)
      render 'show'
    else
      flash[:update_error] = 'cannot update the technology'
      render 'new'
    end
  end

  def delete
    @technology = Technology.find(params[:id])
    @technology.delete
    redirect_to root_path
  end

  private

  def technology_params
    params.require(:technology).permit(:title, :discription, :icon)
  end
end
