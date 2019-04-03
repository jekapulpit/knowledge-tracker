class Api::AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_answer, only: %i[update destroy]

  def index
    render json: { answers: Question.find(params[:question_id]).answers }
  end

  def update
    answer = Answer.find(params[:id])
    answer.update_attributes(answer_params)
    render json: { answer: answer }
  end

  def destroy
    render json: { deleted: @answer.destroy }
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_text)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
