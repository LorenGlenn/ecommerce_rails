class ReviewsController < ApplicationController
  def create
    @product = Product.find(review_params[:product_id])
    @review = @product.reviews.new(review_params)
    @comment = Comment.new
    @user = current_user
    if @review.save
      flash[:notice] = "Review created!"
      respond_to do |format|
        format.html { redirect_to product_path(@product.id) }
        format.js
      end
    else
      flash[:notice] = "Review couldn't be created"
      redirect_to product_path(@product.id)
    end
  end

    private

    def review_params
      params.require(:review).permit(:content, :score, :product_id, :user_id)
    end

end
