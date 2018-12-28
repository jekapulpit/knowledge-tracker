module Tests
  class StartOperation
    def initialize(test, current_user)
      @test = test
      @current_user = current_user
    end

    def call
      @current_user.tests << @test unless @test.in? @current_user.tests
      @current_user.technologies << @test.technology unless @test.technology.in? @current_user.technologies
      @test_result = @current_user.test_results.find_by(test_id: @test.id)
      @test_result.result = 0
      @test_result.save
    end
  end
end
