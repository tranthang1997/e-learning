class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :correct_answer
      t.references :word, foreign_key: true
      t.timestamps
    end
  end
end
