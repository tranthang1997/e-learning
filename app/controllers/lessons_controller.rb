class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_course, only: %i(do_lesson view_result)
  before_action :find_result, only: :view_result
  before_action :find_user, only: :view_result

  def do_lesson
    @lesson = Supports::Lesson.new current_user, @course
  end

  def submit_answer
    data = params[:data_value]
    score = LessonService.new(data, current_user).score
    result = Result.where(user_id: current_user.id, course_id: data[:course_id]).order_by_column(created_at: :desc).first
    respond_to do |format|
      if result.update grade: score, answers: data[:answers].to_json,
        status: Settings.lesson.submited
        format.json do
          render json: {"value" => t("success"), "data" => {"course_id" => data[:course_id], "result_id" => result.id}}
        end
      else
        format.json do
          render json: {"value" => t("errors")}
        end
      end
    end
  end

  def view_result
    @result = Supports::Lesson.new @user, @course
  end

  private

  def find_course
    @course = Course.find_by id: params[:course_id]
    return if @course
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def find_result
    @res = Result.find_by id: params[:result_id]
    return if @res
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def find_user
    @user = User.find_by id: params[:user_id]
    return if @user
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
