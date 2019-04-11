class UsersController < ApplicationController
  def new
  end
  def show
  	@user=User1.all
  end
end
