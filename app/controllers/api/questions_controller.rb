class Api::QuestionsController < ApplicationController
  def index
    questions = Test.find(params[:test_id]).questions
    render json: { questions: questions.map(&:with_answers) }
  end

  def update; end

  private

  def allowed_params
    params.require(:question).permit(:question_text, :right_answer, :test_id, :technology_id, answers_attributes: [:id, :answer_text])
  end
end
