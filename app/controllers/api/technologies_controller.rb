class Api::TechnologiesController < ApplicationController
  def index
    technologies = Technology.all.paginate(page: params[:page])
    json = technologies.map(&:all_attributes)
    render json: json
  end
end
