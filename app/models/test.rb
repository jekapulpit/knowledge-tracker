class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_results
  belongs_to :technology
  enum status: [ :new, :approved ]

  def with_user_result(user)
    attributes
        .merge(passed: passed_by_user?(user))
  end

  def passed_by_user?(user)
    user.test_results.find_by(test: self, result: self.questions.count)
  end
end
