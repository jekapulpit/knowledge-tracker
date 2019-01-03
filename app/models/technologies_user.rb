class TechnologiesUser < ApplicationRecord
  self.per_page = 10

  belongs_to :user
  belongs_to :technology
end
