class TestsController < ApplicationController
  before_action :set_test, only: %i[start show update destroy]

  def start
    Tests::StartOperation.new(@test, current_user).call
  end

  def show
    @technology = @test.technology
  end

  def finish
    test_result = current_user.test_results.includes(:test).last
    UpdateProgressJob.perform_later current_user
    respond_to do |format|
      format.json do
        render json: { result: test_result.result,
                       number_of_questions: test_result.test.questions.count }
      end
    end
  end

  def new
    @technology = Technology.find(params[:technology_id])
    @test = Test.new
    authorize @test
  end

  def create
    test = Test.new(test_params)
    authorize test
    if test.save
      redirect_to technology_test_path(test.technology, test)
    else
      render 'new'
    end
  end

  def update
    authorize @test
    @test.update(test_params)
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
