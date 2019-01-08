class VotesController < ApplicationController
  def vote
    technology = Technology.find(params[:technology])
    user_mark = technology.marks.find_by(user_id: current_user.id)
    if user_mark
      user_mark.update(value: params[:rating])
    else
      technology.marks << Mark.new(user_id: current_user.id, value: params[:rating])
    end
    update_avarage_mark(technology)

    respond_to do |format|
      format.json { render json: { average_mark: technology.average_mark } }
    end
  end

  private

  def update_avarage_mark(technology)
    technology.update(average_mark: technology.marks.average(:value))
  end
end
