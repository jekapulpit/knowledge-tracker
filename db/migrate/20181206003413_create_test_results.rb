class CreateTestResults < ActiveRecord::Migration[5.1]
  def change
    create_table :test_results do |t|
      t.belongs_to :user, index: true
      t.belongs_to :test, index: true
      t.integer :result
      t.timestamps
    end
  end
end
