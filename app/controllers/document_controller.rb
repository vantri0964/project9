class DocumentController < ApplicationController
  def index
    @document = @microposts = Micropost.paginate(page: params[:page], per_page: 12)
  end
end
