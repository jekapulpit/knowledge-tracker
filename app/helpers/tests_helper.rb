module TestsHelper
  def passed?(test)
    current_user.test_results.find_by(test_id: test.id, result: test.questions.count)
  end
end
