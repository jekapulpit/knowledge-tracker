class TechnologiesController < ApplicationController
  before_action :set_technology, only: %i[edit show update destroy]

  def index
    @categories = [
      ['all', nil],
      *Category.pluck(:title, :id)
    ]
    @technologies = if params[:category].present?
                      Category.find(params[:category]).technologies
                    else
                      Technology.all
                    end

    @technologies = TechnologiesSorter.new(params[:sort_by]).apply_on(@technologies)
    @technologies = @technologies.paginate(page: params[:page])
  end

  def edit
    authorize @technology
  end

  def show
    @user_mark = @technology.marks.find_by(user: current_user)
    IncrementViewsJob.perform_later @technology
  end

  def new
    @technology = Technology.new
    authorize @technology
  end

  def create
    authorize @technology
    if Technology.create(technology_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    authorize @technology
    if @technology.update(technology_params)
      render 'show'
    else
      flash[:update_error] = 'cannot update the technology'
      render 'new'
    end
  end

  def destroy
    @technology.destroy

    redirect_to root_path
  end

  private

  def set_technology
    @technology = Technology.find(params[:id])
  end

  #  def not_users_technologies
  #    sql = 'select "id" from technologies
  #           except
  #           SELECT "id" FROM "technologies" INNER JOIN
  #           "technologies_users" ON "technologies"."id" = "technologies_users"."technology_id"
  #           WHERE "technologies_users"."user_id" = 46'
  #    technologies_as_array = Technology.find_by_sql(sql)
  #    technologies_as_relation = Technology
  #                                   .where(id: technologies_as_array.map(&:id))
  #  end

  def technology_params
    params.require(:technology).permit(:title, :discription, :icon)
  end
end
