class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]
  def create
    @micropost=current_user.microposts.build(microposts_params)
    if @micropost.save
      flash[:success]= "microposts created"
      redirect_to document_path
    else
      @feed_items=[]
      render "post_documents/index"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || document_path
  end

  def show
    @showDoc = Micropost.find_by(id:params[:id])
  end
  private
    def microposts_params
      params.require(:micropost).permit(:content,:picture, :attachment,:typemicropost_id, :title)
    end

    def correct_user
      @micropost=current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end