class CoursesController < ApplicationController
  before_action :authenticate_user!

  def search
    @courses = Course.ransack(params[:q]).result.page(params[:page])
      .per(Settings.course.course_per_page).order_by_column created_at: :desc
  end
end
