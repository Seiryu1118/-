class Public::CommentsController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.review_id = review.id
    @comment.save
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], review_id: params[:review_id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end