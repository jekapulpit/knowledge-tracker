class CreateTechnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :technologies do |t|
      t.string :title
      t.text :discription
      t.float :progress
      t.timestamps
    end
  end
end
