class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    binding.pry
    redirect_to product_path(review_params[:product_id])
  end

    private

    def review_params
      params.require(:review).permit(:content, :score, :product_id, :user_id)
    end

end
