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

  def create
    answer = Answer.new
    answer.attributes = answer_params
    render json: { answer: answer, valid: answer.save }
  end

  def answer
    correct = (Question.find(params[:question_id])
                   .right_answer == params[:answer_id].to_i)
    if correct
      test_result = current_user.test_results.last
      test_result.result = test_result.result + 1
      test_result.save
    end
    render json: { success: correct }
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_text, :question_id)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
