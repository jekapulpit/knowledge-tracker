class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_results
  belongs_to :technology
end
