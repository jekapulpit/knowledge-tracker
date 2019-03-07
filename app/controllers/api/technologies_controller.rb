class Api::TechnologiesController < ApplicationController
  def index
    technologies = Technology.all.paginate(page: params[:page])
    render json: technologies
  end
end
