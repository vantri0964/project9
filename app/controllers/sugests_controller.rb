class SugestsController < ApplicationController
  before_action  :logged_in_user

  def new
    @sugest = Sugest.new
  end

  def create
    @sugests = Sugest.new sugest_params
    if @sugests.save
      flash[:success] = "Cảm ơn bạn đã gửi phản hồi ?"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def sugest_params
    params.require(:sugest).permit :types, :mesages, :user_id
  end
end
