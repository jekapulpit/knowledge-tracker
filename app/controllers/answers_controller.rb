class AnswersController < ApplicationController
  def answer
    @question = Question.find(params[:question])
    @is_right = (@question.right_answer == params[:ans].to_i)
    if @is_right
      @test_result = current_user.test_results.find_by(test_id: params[:test])
      @test_result.result = @test_result.result + 1
      @test_result.save
    end
    respond_to do |format|
      format.json {render json: { success: @is_right }}
    end
  end
end
