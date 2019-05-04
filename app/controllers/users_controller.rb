class UsersController < ApplicationController
  before_action  :logged_in_user, only:[:edit,:update,:index,:destroy]
  before_action :correct_user, only:[:edit,:update]
  before_action :admin_user, only: [:destroy]
  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
      @user.send_activation_email
  		flash[:info] = "please check your email to activate your acount."
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="profile updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  def index
  	@user = if params[:name]
    User.where("name LIKE ?", "%#{params[:name]}%")
    else
    User.all
    end
  end

  def show
  	@user=User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 5)
  end

  def destroy
  	@user=User.find(params[:id])
  	if @user.destroy
  		flash[:success] = "delete successfully!"
  		redirect_to users_url
  	else
  		//
  	end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @microposts = @user.following.paginate(page: params[:page],per_page:5)
    render 'users/show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @microposts = @user.followers.paginate(page: params[:page],per_page:5)
    render 'users/show_follow'
  end


  private
  def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :picture)
  end

  def correct_user
    @user=User.find(params[:id])
    redirect_to (root_url) unless current_user?(@user)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
