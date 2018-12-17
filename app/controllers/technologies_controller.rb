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

  def new
    @technology = Technology.new
  end

  def create
    if Technology.create(technology_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @technology = Technology.find(params[:id])
    if @technology.update(technology_params)
      render 'show'
    else
      flash[:update_error] = 'cannot update the technology'
      render 'new'
    end
  end

  def destroy
    @technology = Technology.find(params[:id])
    @technology.destroy

    redirect_to root_path
  end

  private

  def technology_params
    params.require(:technology).permit(:title, :discription, :icon)
  end
end
