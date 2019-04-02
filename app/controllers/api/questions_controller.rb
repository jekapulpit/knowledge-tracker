class Api::QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    questions = Test.find(params[:test_id]).questions
    render json: { questions: questions.map(&:with_answers) }
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(allowed_params)
  end

  private

  def allowed_params
    params.require(:question).permit(:question_text, :right_answer, answers_attributes: [:id, :answer_text])
  end
end
