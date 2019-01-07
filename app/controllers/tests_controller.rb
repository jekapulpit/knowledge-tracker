class TestsController < ApplicationController
  before_action :set_test

  def start
    Tests::StartOperation.new(@test, current_user).call
  end

  def show; end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
