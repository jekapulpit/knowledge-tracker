class Api::TechnologiesController < ApplicationController
  def index
    technologies = Technology.all.paginate(page: params[:page])
    techs = technologies.map(&:all_attributes)
    render json: techs
  end
end
