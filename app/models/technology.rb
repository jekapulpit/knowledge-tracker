class Technology < ApplicationRecord
  has_many :tests
  has_and_belongs_to_many :users
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  has_one_attached :icon

>>>>>>> setting avatar for user and icon for tech
=======
  has_one_attached :icon

=======
>>>>>>> 993bdb0... rubocop changes
>>>>>>> commit from master
=======
  has_one_attached :icon
>>>>>>> rubocop changes 2.0
end
