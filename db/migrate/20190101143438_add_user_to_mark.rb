class AddUserToMark < ActiveRecord::Migration[5.2]
  def change
    add_reference :marks, :user, foreign_key: true
  end
end
