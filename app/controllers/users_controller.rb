class UsersController < ApplicationController
  def new
  	@user=User.new
  end
  def create
  	@user=User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  def index
  	@user=User.all
  end
  def show
  	@user=User.find(params[:id])
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
  private
  def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation,:password_digest)
  end
end
