class AnswersController < ApplicationController
  def answer
    correct = (Question.find(params[:question_id])
                     .right_answer == params[:answer_id].to_i)
    if correct
      test_result = current_user.test_results.find_by(test_id: params[:test_id])
      test_result.result = test_result.result + 1
      test_result.save
    end
    respond_to do |format|
      format.json { render json: { success: correct } }
    end
  end
end
