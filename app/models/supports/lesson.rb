class Supports::Lesson
  def initialize user, course
    @user = user
    @course = course
  end

  def question_list
    words = @course.words
    return if words.empty?
    Question.in_words(words).rand.limit(Settings.question.questions_number).includes(:answers)
  end

  def time
    ResultService.new(@user, @course).get_time
  end

  def grade result_id
    words = Course.find_by(id: @course.id).words
    return if words.empty?
    Result.where(user_id: @user.id, course_id: @course.id, id: result_id).order_by_column(created_at: :desc).first.grade
  end

  def get_result result_id
    words = Course.find_by(id: @course.id).words
    return if words.empty?
    question_list = Question.in_words(words).includes :answers
    result = Result.where(user_id: @user.id, course_id: @course.id, id: result_id).order_by_column(created_at: :desc).first
    return if result.answers.nil?
    answers = ActiveSupport::JSON.decode result.answers
    answers.each do |key, value|
      question_list.each do |value_ques|
        if value["question_id"].to_i == value_ques.id.to_i
          answers[key]["question"] = value_ques.question
          answers[key]["answers"] = value_ques.answers
          answers[key]["correct_answer"] = value_ques.correct_answer
          break
        end
      end
    end
  end

  private

  attr_reader :user, :course
end
