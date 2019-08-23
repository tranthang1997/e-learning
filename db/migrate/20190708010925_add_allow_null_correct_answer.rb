class AddAllowNullCorrectAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :correct_answer, :string, :null => true
  end
end
