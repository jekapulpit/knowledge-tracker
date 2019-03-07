class Api::TechnologiesController < ApplicationController
  def index
    technologies = Technology.all.paginate(page: params[:page])
    techs = technologies.map do |technology|
      technology.all_attributes
    end
    render json: techs
  end
end
