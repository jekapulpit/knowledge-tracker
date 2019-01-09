class QuestionsController < ApplicationController
  def update
    @question = Question.find(params[:id])
    authorize @question
    @question.update(question_params)

    redirect_to technology_test_path(params[:technology_id], params[:test_id])
  end

  private

  def question_params
    params.require(:question).permit(:question_text, :right_answer)
  end
end
