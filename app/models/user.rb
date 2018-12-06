class User < ApplicationRecord

  has_many :technologies
  has_and_belongs_to_many :technologies
  has_many :tests, through: :test_results

end
