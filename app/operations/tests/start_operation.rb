module Tests
  class StartOperation
    attr_reader :test, :user

    def initialize(test, user)
      @test = test
      @user = user
    end

    def call
      user.tests << test
      user.technologies << test.technology unless test.technology.in? user.technologies
      reset_result
    end

    private

    def reset_result
      test_result = user.test_results.last
      test_result.result = 0
      test_result.save
    end
  end
end
