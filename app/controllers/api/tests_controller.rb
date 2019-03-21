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

  private

  def test_params
    params.require(:test).permit(:title, :discription, :technology_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
