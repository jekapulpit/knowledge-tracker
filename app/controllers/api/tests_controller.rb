class Api::TestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_test, only: %i[update destroy]

  def index
    tests = Technology.find(params[:technology_id]).tests
    render json: { tests: tests.map{ |test| test.with_user_result(current_user) } }
  end

  def create
    test = Test.new
    test.attributes = test_params
    render json: { test: test, valid: test.save }
  end

  def update
    @test.update_attributes(test_params)
    render json: {test: @test.with_user_result(current_user)}
  end

  def destroy
    render json: { deleted: @test.destroy }
  end

  def finish
    test_result = current_user.test_results.includes(:test).last
    ProgressWorker.perform_async current_user.id
    respond_to do |format|
      format.json do
        render json: { result: test_result.result,
                       number_of_questions: test_result.test.questions.count }
      end
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :discription, :technology_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
