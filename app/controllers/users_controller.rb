class UsersController < ApplicationController
  def new
  end
  def index
  	@user=User.all
  end
  def show
  	@user=User.find(params[:id])
  end
  def user_params
      params.require(:user).permit(:name, :email, :pass_word, :point, :code, :confirm, :role)
  end
end
