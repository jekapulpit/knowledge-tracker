class RebuildUsersTechsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :technologies_users
    create_table :technologies_users do |t|
      t.float :progress, default: 0
      t.belongs_to :user, index: true
      t.belongs_to :technology, index: true
      t.timestamp
    end
  end
end
