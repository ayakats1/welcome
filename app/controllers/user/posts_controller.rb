class User::PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @shops = Shop.all
    
  end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews
  end
end