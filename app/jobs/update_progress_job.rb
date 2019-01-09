class UpdateProgressJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.technologies.each { |technology| update_progress(technology, user) }
  end

  def update_progress(technology, user)
    passed_tests = 0
    technology.tests.each do |test|
      max_result = user.test_results.find_by(test: test, result: test.questions.count)
      passed_tests += 1 if max_result
    end
    user
      .technologies_users
      .find_by(technology_id: technology.id)
      .update(progress: passed_tests * 100 / technology.tests.count)
  end
end
