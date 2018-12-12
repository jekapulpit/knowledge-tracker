class TechnologiesController < ApplicationController

  def show

  end

  def create

  end

  def update

  end

  def delete

  end

  private

  def technology_params
    params.require(:technology).permit(:title, :discription, :icon)
  end

end
