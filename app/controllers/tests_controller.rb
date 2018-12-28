class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])
    Tests::StartOperation.new(@test, current_user).call
  end
end
