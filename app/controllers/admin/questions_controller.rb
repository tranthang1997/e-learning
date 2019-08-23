class Admin::QuestionsController < AdminController
  before_action :load_question, only: %i(show edit update destroy)

  def index
    @questions = Question.includes(:word).page(params[:page]).per(Settings.questions.question_per_page)
      .order_by_column :question
  end

  def create
    @question = Question.new questions_params
    if @question.save
      redirect_to admin_questions_path
    else
      flash[:danger] = t "question.create_failed"
      render :new
    end
  end

  def new
    @question = Question.new
  end

  def edit; end

  def update
    if @question.update questions_params
      flash[:success] = t "question.update_success"
      redirect_to admin_questions_path
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "question.delete_success"
      redirect_to admin_questions_path
    else
      render :new
    end
  end

  private

  def load_question
    @question = Question.find_by id: params[:id]
    return if @question
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def questions_params
    params.require(:question).permit Question::QUESTION_PARAMS
  end
end
