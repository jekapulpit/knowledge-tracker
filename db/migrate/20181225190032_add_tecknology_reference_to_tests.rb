class AddTecknologyReferenceToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :technology, foreign_key: true
  end
end
