class Admin::SharesController < ApplicationController
  before_action :admin_user
  before_action :load_micropost, only: %i(destroy update)
  def index
    @microposts = Micropost.all.paginate(page: params[:page], per_page:10)
    @q = Micropost.ransack(params[:q])
    @microposts = @q.result.page(params[:page])
  end

  def destroy
    if @micropost.destroy
      flash[:info] = "Micropost has been delete!"
    else
      flash[:danger] = "Unsuccefully!"
    end
    redirect_to admin_shares_path
  end

  private

  def load_micropost
    @micropost = Micropost.find_by id: params[:id]
    return if @micropost
    flash[:info] = "Micropost not found!"
    redirect_to some_url admin_shares_path
  end
end
