class AddAvgMarkToTechnology < ActiveRecord::Migration[5.2]
  def change
    add_column :technologies, :average_mark, :float
  end
end
