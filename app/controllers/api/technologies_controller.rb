class Api::TechnologiesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    technologies = if params[:category].present? and params[:category] != 'all'
                     Category.find(params[:category]).technologies
                   else
                     Technology.all
                   end
    technologies = TechnologiesSorter.new(params[:sort_by]).apply_on(technologies)
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

  def update
    technology = Technology.find(params[:id])
    technology.update_attributes(technology_params)
    render json: { technology: technology.all_attributes }
  end

  private

  def technology_params
    params.require(:technology).permit(:title, :discription)
  end
end
