class Admin::ReviewsController < ApplicationController
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_post_path(@post)
  end
end
