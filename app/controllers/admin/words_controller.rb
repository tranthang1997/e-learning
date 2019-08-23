class Admin::WordsController < AdminController
  before_action :load_word, only: %i(show edit update destroy)

  def index
    @words = Word.page(params[:page]).per(Settings.words.word_per_page)
      .includes(:course)
  end

  def create
    @word = Word.new words_params
    if @word.save
      flash[:success] = t "word.create_success"
      redirect_to admin_word_path(@word)
    else
      render :new
    end
  end

  def new
    @word = Word.new
  end

  def show; end

  def edit; end

  def update
    if @word.update words_params
      flash[:success] = t "word.update_success"
      redirect_to admin_word_path(@word)
    else
      render :edit
    end
  end

  def destroy
    if @word.destroy
      flash[:success] = t "word.delete_success"
    else
      flash[:danger] = t "word.delete_failed"
    end
    redirect_to admin_words_path
  end

  private

  def load_word
    @word = Word.find_by id: params[:id]
    return if @word
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def words_params
    params.require(:word).permit Word::WORD_PARAMS
  end
end
