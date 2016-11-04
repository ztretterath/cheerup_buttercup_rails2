class CheerUpsController < ApplicationController
  def index
    cheer_ups = CheerUp.all

    render json: {status: 200, cheer_ups: cheer_ups}
  end

  def show
    cheer_up = CheerUp.find(params[:id])

    render json: {status: 200, cheer_up: cheer_up}
  end

  # Adds a review to a cheerup
  def add_review
    cheer_up = CheerUp.find(params[:id])
    cheer_up.reviews.create(review_params)

    render json:{
      status: 200,
      cheer_up: cheer_up,
      review: cheer_up.reviews
    }
  end

  # Updates a cheerup review

  def update_review
    review = Review.find(params[:id])

    review.update(review_params)

    render json: {status: 200, review: review}
  end


  private
    def cheer_up_params
        params.require(:cheer_up).permit(:title, :content, :category, :user_id)
    end

    def review_params
      params.require(:review).permit(:value, :cheer_up_id, :user_id)
    end

end
