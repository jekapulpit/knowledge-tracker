class AddRightAnswerToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :right_answer, :integer, null: true
  end
end
