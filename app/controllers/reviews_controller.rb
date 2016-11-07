class ReviewsController < ApplicationController

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      render json: review
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end


  private
    def review_params
      params.require(:review).permit(:value, :cheer_up_id, :user_id)
    end

end
