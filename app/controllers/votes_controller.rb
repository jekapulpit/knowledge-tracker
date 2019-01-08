class VotesController < ApplicationController
  def vote
    technology = Technology.find(params[:technology])
    add_mark(technology)
    update_avarage_mark(technology)

    respond_to do |format|
      format.json { render json: { average_mark: technology.average_mark } }
    end
  end

  private

  def add_mark(technology)
    user_mark = technology.marks.find_by(user: current_user)
    if user_mark
      user_mark.update(value: params[:rating])
    else
      technology.marks << Mark.new(user: current_user, value: params[:rating])
    end
  end

  def update_avarage_mark(technology)
    technology.update(average_mark: technology.marks.average(:value))
  end
end
