class ChangeDefaultTestStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :tests, :status, :int, :default => 'not_approved'
  end
end
