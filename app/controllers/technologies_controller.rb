class TechnologiesController < ApplicationController
  
  private

  def technology_params
    params.require(:technology).permit(:title, :discription, :icon)
  end

end
