class TestsController < ApplicationController
  before_action :set_test, only: %i[start show update destroy]

  def start
    Tests::StartOperation.new(@test, current_user).call
  end

  def show
    @technology = @test.technology
  end

  def finish
    test_result = current_user.test_results.last
    UpdateProgressJob.perform_later current_user
    respond_to do |format|
      format.json { render json: { result: test_result.result } }
    end
  end

  def new
    @technology = Technology.find(params[:technology_id])
    @test = Test.new
  end

  def create
    test = Test.new(test_params)
    if test.save
      redirect_to technology_test_path(test.technology, test)
    else
      render 'new'
    end
  end

  def update

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

  def test_params
    params.require(:test).permit(:title, :discription, :technology_id)
  end
end
