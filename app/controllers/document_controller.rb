class DocumentController < ApplicationController
  def index
    @document =Micropost.all.search_type(params[:category_id]);
    @document = Micropost.where("title like ?","%#{params[:title]}%") if params[:title].present?
    @document = @document.paginate(page: params[:page], per_page: 12)
  end
end
