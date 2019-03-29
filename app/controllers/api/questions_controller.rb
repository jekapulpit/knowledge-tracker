class QuestionsController < ApplicationController
  def index
    questions = Test.find(params[:test_id]).questions
  end
end
