class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :load_user, except: %i(index)
  def admin_user
    if logged_in?
    return root_path unless current_user.admin?
    else
      flash[:danger] = "you are log in!"
      redirect_to login_path
    end
  end
  def index
    # @user = User.paginate(page: params[:page], per_page: 10)
    user = search(params[:name], params[:email], params[:activated])
    @user = user.paginate(page: params[:page], per_page: 10)
  end

  def create
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "update #{@user.name} successfully!"
      redirect_to admin_users_path
    else
      flash[:danger] = "not update!"
    end
  end

  def edit; end

  def destroy
    if @user.destroy
      flash[:info] = "delete #{@user.name} successfully!"
      redirect_to admin_users_path
    else
      flash[:danger] ="not delete!"
    end
  end

  private
  def load_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation,
                                 :picture
  end

  def search name, email, activated
    if activated == "activate"
      activated = true
    else
      activated = false
    end
    @user = User.all
    @user = User.where(["name LIKE ?","%#{name}%"]) if name.present?
    @user = User.where(["email LIKE ?","%#{email}%"]) if email.present?
    @user = User.where(["activated LIKE ?", activated]) if activated.present?
    return @user
  end
end
