class AddStatusForTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :status, :int
  end
end
