class Api::TechnologiesController < ApplicationController
  def index
    technologies = Technology.all.paginate(page: params[:page])
    json = technologies.map(&:all_attributes)
    render json: {
        technologies: json,
        page: technologies.current_page,
        totalPages: technologies.total_pages
    }
  end
end
