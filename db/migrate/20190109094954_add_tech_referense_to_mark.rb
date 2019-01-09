class AddTechReferenseToMark < ActiveRecord::Migration[5.2]
  def change
    add_reference :marks, :technology, foreign_key: true
  end
end
