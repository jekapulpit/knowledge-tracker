class ChangeReferensesTechUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :technologies, :progress
    add_column :technologies_users, :progress, :float
    add_timestamps(:technologies_users)
  end
end
