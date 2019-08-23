module LessonsHelper
  def get_correct_answer answer_id
    answer = Answer.find_by id: answer_id
    return unless answer
    answer.content
  end
end
