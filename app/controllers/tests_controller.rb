class TestsController < ApplicationController
  before_action :set_test, only: %i[start show update destroy]

  def start
    Tests::StartOperation.new(@test, current_user).call
  end

  def show
    @technology = @test.technology
  end
  
  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :discription, :technology_id)
  end
end
