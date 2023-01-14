class HomesController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(3)
  end

  def about
  end
end
