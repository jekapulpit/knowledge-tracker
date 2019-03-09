class Api::TechnologiesController < ApplicationController
  def index
    technologies = if params[:category].present?
                     Category.find(params[:category]).technologies
                   else
                     Technology.all
                   end
    technologies = technologies.paginate(page: params[:page])
    json = technologies.map(&:all_attributes)
    render json: {
        technologies: json,
        page: technologies.current_page,
        totalPages: technologies.total_pages,
        category: params[:category],
        sortBy: params[:sort_by] || 'views-desc'
    }
  end
end
