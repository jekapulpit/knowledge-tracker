class TestsController < ApplicationController
  before_action :set_test, only: %i[start show destroy]

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

  def destroy
    technology = @test.technology
    authorize @test
    TestResult.where(test: @test).destroy_all
    @test.destroy

    redirect_to technology_path(technology)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
