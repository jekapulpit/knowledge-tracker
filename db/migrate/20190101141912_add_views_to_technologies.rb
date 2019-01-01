class AddViewsToTechnologies < ActiveRecord::Migration[5.2]
  def change
    add_column :technologies, :views, :integer, default: 0
  end
end
