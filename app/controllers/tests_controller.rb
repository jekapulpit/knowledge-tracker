class TestsController < ApplicationController

  def show
    @test = Test.find(params[:id])
    @correct_answers ||= 0
  end

  def answer
    @question = Question.find(params[:question])
    respond_to do |format|
      format.js
    end
  end

end
