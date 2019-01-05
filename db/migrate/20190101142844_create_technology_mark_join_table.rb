class CreateTechnologyMarkJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :technologies, :marks do |t|
      t.index :technology_id
      t.index :mark_id
    end
  end
end
