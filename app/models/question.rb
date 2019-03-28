class Question < ApplicationRecord
  has_many :answers, dependent: :destroy, inverse_of: :question
  belongs_to :test
  accepts_nested_attributes_for :answers
end
