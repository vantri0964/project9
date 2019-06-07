class MemberController < ApplicationController
  def index
  	@member = User.order("name").page(params[:page]).per_page(7)
  end
end
