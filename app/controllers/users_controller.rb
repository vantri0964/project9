class UsersController < ApplicationController
  def new
  end
  def show
  	@user=User.all
  end
end
