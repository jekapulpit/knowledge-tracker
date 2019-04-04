class Api::QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    questions = Test.find(params[:test_id]).questions.order(:created_at)
    render json: { questions: questions.map(&:with_answers) }
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(allowed_params)
    render json: { question: question }
  end

  def create
    question = Question.new
    question.attributes = question_params
    render json: { question: question, valid: question.save }
  end

  def destroy
    question = Question.find(params[:id])
    render json: { deleted: question.destroy }
  end

  private

  def allowed_params
    params.require(:question).permit(:question_text, :right_answer, answers_attributes: [:id, :answer_text])
  end

  def question_params
    params.require(:question).permit(:question_text, :test_id)
  end
end
