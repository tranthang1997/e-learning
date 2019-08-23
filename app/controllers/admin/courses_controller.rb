class Admin::CoursesController < AdminController
  before_action :find_course, except: %i(index new create)

  def index
    @courses = Course.page(params[:page]).per(Settings.course.course_per_page)
      .order_by_column created_at: :desc
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build course_params
    if @course.save
      flash[:success] = t "course.create_success"
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update course_params
      flash[:success] = t "course.edit_success"
      redirect_to admin_courses_path
    else
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = t "course.destroy_success"
    else
      flash[:danger] = t "course.destroy_fail"
    end
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit Course::COURSE_PARAMS
  end

  def find_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "course.notfound"
    redirect_to admin_index_path
  end
end
