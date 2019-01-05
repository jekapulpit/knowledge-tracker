class ChangeMarkToValue < ActiveRecord::Migration[5.2]
  def change
    change_table :marks do |t|
      t.remove :mark
      t.integer :value
    end
  end
end
