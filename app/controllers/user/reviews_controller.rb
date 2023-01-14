class User::ReviewsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @review = current_user.reviews.build(post_id: @post.id)
  end

  def create
    @review = current_user.reviews.build(review_params)
    @post = @review.post
    if @review.save
      redirect_to post_path(params[:post_id]), notice: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to post_path(@post)
  end

  def review_params
    params.require(:review).permit(:post_id, :star, :review)
  end
end
