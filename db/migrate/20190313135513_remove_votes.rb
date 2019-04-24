class RemoveVotes < ActiveRecord::Migration[5.2]
  def change
    drop_table :marks
    remove_column :technologies, :average_mark
  end
end
