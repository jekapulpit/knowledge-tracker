class VotesController < ApplicationController
  def vote
    technology = Technology.find(params[:technology])
    user_mark = add_mark_to_technology(technology)
    update_avarage_mark(technology)

    respond_to do |format|
      format.json { render json: { average_mark: technology.average_mark, mark_id: user_mark.id  } }
    end
  end

  def destroy
    mark = Mark.find(params[:id])
    technology = mark.technology
    mark.destroy
    update_avarage_mark(technology)

    redirect_to technology_path(technology)
  end

  private

  def add_mark_to_technology(technology)
    user_mark = technology.marks.find_by(user: current_user)
    if user_mark
      user_mark.update(value: params[:rating])
    else
      user_mark = Mark.new(user: current_user, value: params[:rating])
      technology.marks << user_mark
    end
    user_mark
  end

  def update_avarage_mark(technology)
    technology.update(average_mark: technology.marks.average(:value))
  end
end
