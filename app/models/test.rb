class Test < ApplicationRecord

  has_many :questions
  has_many :users, through: :test_results
  belongs_to :technology


end
