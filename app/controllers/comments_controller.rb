class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @review = Review.find(comment_params[:review_id])
    redirect_to product_path(@review.product_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :review_id, :user_id)
  end
end
