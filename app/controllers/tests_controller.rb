class TestsController < ApplicationController

  def show
    @test = Test.find(params[:id])
    start_test @test
  end

  def answer
    @question = Question.find(params[:question])
    @is_right = (@question.right_answer == params[:ans].to_i)
    if @is_right
      @test_result = current_user.test_results.find_by(:test_id => params[:test])
      @test_result.result = @test_result.result + 1
      @test_result.save
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def start_test test
    current_user.tests << test unless test.in? current_user.tests
    @test_result = current_user.test_results.find_by(:test_id => test.id)
    @test_result.result = 0
    @test_result.save
  end

end
