class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build review_params
    if @review.save
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit :Micropost_id, :rating, :User_id
  end
end
