class TechnologiesUser < ApplicationRecord
  belongs_to :user
  belongs_to :technology

  self.per_page = 10
end
