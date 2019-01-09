class TestsController < ApplicationController
  before_action :set_test, only: %i[start show]

  def start
    Tests::StartOperation.new(@test, current_user).call
  end

  def show; end

  def finish
    test_result = current_user.test_results.last
    UpdateProgressJob.perform_later current_user
    respond_to do |format|
      format.json { render json: { result: test_result.result } }
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
