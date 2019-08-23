module WordsHelper
  def convert_courses
    Course.pluck :name, :id
  end
end
