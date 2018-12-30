module Tests
  class StartOperation
    def initialize(test, user)
      @test = test
      @user = user
    end

    def call
      @user.tests << @test unless @test.in? @user.tests
      @user.technologies << @test.technology unless @test.technology.in? @user.technologies
      @test_result = @user.test_results.find_by(test_id: @test.id)
      @test_result.result = 0
      @test_result.save
    end
  end
end
