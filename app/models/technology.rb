class Technology < ApplicationRecord
  has_many :tests
  has_and_belongs_to_many :users
  has_one_attached :icon
end
