class DropTechMarkJoinTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :marks_technologies
  end
end
