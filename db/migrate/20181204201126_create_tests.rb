class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.text :discription
      t.references :users
      t.timestamps
    end
  end
end
