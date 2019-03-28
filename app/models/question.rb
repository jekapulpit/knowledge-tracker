class Question < ApplicationRecord
  has_many :answers, dependent: :destroy, inverse_of: :question
  has_one_attached :picture
  belongs_to :test
  enum type: [ :checkbox, :radio, :text ]
  accepts_nested_attributes_for :answers
end
