module QuestionsHelper
  def convert_words
    Word.pluck :name, :id
  end

  def convert_answers question_id
    Answer.where(question_id: question_id).pluck :content, :id
  end
end
