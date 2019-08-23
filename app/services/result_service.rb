class ResultService
  def initialize user, course
    @user = user
    @course = course
  end

  def get_time
    result = Result.where(user_id: @user.id, course_id: @course.id).order_by_column(created_at: :desc).first
    if result.nil? || (!result.nil? && (Time.now - result.created_at - Settings.time.time_do_lesson.seconds).to_i < 0 && result.status == 1) ||
        (!result.nil? && (Time.now - result.created_at - Settings.time.time_do_lesson.seconds).to_i > 0)
      new_result = Result.new user_id: @user.id, course_id: @course.id
      if new_result.save
        Settings.time.time_do_lesson
      end
    else
      (result.created_at + Settings.time.time_do_lesson.seconds - Time.now).round.to_s
    end
  end
end
