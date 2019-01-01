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
      result_refresh
    end

    private

    def result_refresh
      test_result = user.test_results.find_by(test_id: test.id)
      test_result.result = 0
      test_result.save
    end
  end
end
