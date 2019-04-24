class SetDefaultTestStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :tests, :status, :int, :default => 'new'
  end
end
