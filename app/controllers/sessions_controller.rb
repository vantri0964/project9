  class SessionsController < ApplicationController
  def new; end

  def create
  	user=User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate( params[:session][:password] )
      if user.activated?
        log_in user
        params[:session][:remember_me]=='1'?remember(user):forget(user)
        redirect_back_or user
      else
        message  = "Tài khoảng chưa được kich hoạt. Được gửi ngày #{user.created_at}"
        message += " Kiểm tra email để được kích hoạt. cảm ơn."
        flash[:warning] = message
        redirect_to login_path
      end

  	else
  		flash.now[:danger]="email or password khong chinh xac!"
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_path
  end
end
