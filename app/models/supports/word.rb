class Supports::Word
  attr_reader :page, :course

  def initialize page, course
    @page = page
    @course = course
  end

  def user_learned
    results = Result.includes(:user, :course).where("course_id = ?", @course.id).order_by_column :grade
  end

  def list_words
    @course.words.page(@page).per Settings.word.word_per_page
  end
end
