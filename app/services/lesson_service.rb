class LessonService
  include ApplicationHelper

  def initialize params, user
    @user = user
    @course_id = params[:course_id]
    @answers = params[:answers]
  end

  def score
    words = Course.find_by(id: @course_id).words
    return if words.empty?
    question_list = Question.in_words(words)
    score = 0
    @answers.each do |key, value|
      question_list.each do |value_ques|
        if value[:question_id].to_i == value_ques.id.to_i &&
          value[:answer_id] != "" && value[:answer_id].to_i == value_ques.correct_answer.to_i
          score += 1
          break
        end
      end
    end
    score
  end
end
