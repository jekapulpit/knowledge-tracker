class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :answer_text
      t.references :question
      t.timestamps
    end
    add_reference :questions, :answers, foreign_key: true

  end
end
