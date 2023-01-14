class User::PostsController < ApplicationController
  def index
    # A >= B（A が B 以上）
    @posts = Post.where("created_at_lteq_end_of_day >= ?", Date.today).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews.order(created_at: :desc)
    Time::DATE_FORMATS[:datetime_jp] = '%Y/ %m/ %d'
  end
end