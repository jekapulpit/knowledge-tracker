class Api::TestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    tests = Technology.find(params[:technology_id]).tests
    render json: { tests: tests.map{ |test| test.with_passed_by_user(current_user) } }
  end

  def update
    test = Test.find(params[:id])
    test.update_attributes(test_params)
    render json: {test: test}
  end

  private

  def test_params
    params.require(:test).permit(:id, :title, :discription)
  end
end
