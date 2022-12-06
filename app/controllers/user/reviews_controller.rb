class User::ReviewsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.post_id = params[:post_id]
    @review.user_id = current_user.id
    @review.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @review = Review.find(params[:post_id])
    @review.destroy
    redirect_to post_path
  end

  def review_params
    params.require(:review).permit(:post_id, :user_id, :star, :review)
  end
end
