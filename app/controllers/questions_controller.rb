class QuestionsController < ApplicationController
  before_action :set_test, only: %i[new create destroy]
  def new
    @technology = Technology.find(params[:technology_id])
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if @test.questions << question
      fill_with_answers(question)
      redirect_to technology_test_path(@test.technology, @test)
    else
      render 'new'
    end
  end

  def update
    authorize @question
    @question.update(question_params)

    redirect_to technology_test_path(params[:technology_id], params[:test_id])
  end

  def destroy
    question = Question.find(params[:id])
    authorize question
    question.destroy

    redirect_to technology_test_path(@test.technology, @test)
  end

  private

  def fill_with_answers(question)
    4.times do |index|
      answer = Answer.new(answer_text: params[:answer][index.to_param])
      question.answers << answer
      if index.to_param == params[:question][:right_answer]
        question.update(right_answer: answer.id)
      end
    end
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:question_text, :right_answer, :test_id, :technology_id)
  end
end