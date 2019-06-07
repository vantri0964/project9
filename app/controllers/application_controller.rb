class ApplicationController < ActionController::Base
  require 'devise'
  protect_from_forgery with: :exception
	include SessionsHelper
  def logged_in_user
    unless logged_in?
      store_lacation
      flash[:danger]="Bạn cần đăng nhập vào hệ thống!"
      redirect_to login_url
    end
  end
end
