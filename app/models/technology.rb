class Technology < ApplicationRecord
  has_many :tests
  has_and_belongs_to_many :users
<<<<<<< HEAD
  has_one_attached :icon

=======
>>>>>>> 993bdb0... rubocop changes
end
