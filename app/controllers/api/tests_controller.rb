class Api::TestsController < ApplicationController
  def index
    tests = Technology.find(params[:technology_id]).tests
    render json: { tests: tests.map{ |test| test.with_passed_by_user(current_user) } }
  end
end
