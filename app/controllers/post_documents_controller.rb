class PostDocumentsController < ApplicationController
    def index
      if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page],per_page:5)
      end
    end
end
