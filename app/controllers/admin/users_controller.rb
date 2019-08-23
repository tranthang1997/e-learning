class Admin::UsersController < AdminController
  before_action :find_user, except: %i(index new create)

  def index
    @users = User.page(params[:page]).per(Settings.user.user_per_page)
      .order_by_column created_at: :desc
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "user.create_success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "user.edit_success"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user.destroy_success"
    else
      flash[:danger] = t "user.destroy_fail"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user.notfound"
    redirect_to admin_index_path
  end
end
