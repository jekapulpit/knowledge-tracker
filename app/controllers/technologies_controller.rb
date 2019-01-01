class TechnologiesController < ApplicationController
  before_action :set_technology, only: %i[edit show update destroy]
  before_action :increment_views, only: 'show'

  def index
    @categories_array = Category.all.map { |category| [category.title, category.id] }
    @categories_array.insert(0, ['all', nil])
    @technologies = if params[:category].present?
                      Category.find(params[:category]).technologies
                    else
                      Technology.all
                    end

    if params[:sort_by].present?
      @technologies.order!(params[:sort_by].tr('-', ' '))
    else
      @technologies.order!(views: :desc)
    end
    @technologies = @technologies.paginate(page: params[:page])
  end

  def edit;  end

  def show;  end

  def new
    @technology = Technology.new
  end

  def create
    if Technology.create(technology_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
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

  def increment_views
    @technology.views = @technology.views + 1
    @technology.save
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
    params.require(:technology).permit(:title, :discription, :views, :icon)
  end
end
