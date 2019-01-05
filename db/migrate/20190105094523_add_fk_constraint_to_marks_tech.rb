class AddFkConstraintToMarksTech < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :marks_technologies, :marks
    add_foreign_key :marks_technologies, :technologies
  end
end
