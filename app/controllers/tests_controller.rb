class TestsController < ApplicationController
  def start
    @test = Test.find(params[:id])
    Tests::StartOperation.new(@test, current_user).call
  end
end
