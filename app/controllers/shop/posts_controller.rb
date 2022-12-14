class Shop::PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews
  end

  def new
    @shop = current_shop
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.shop_id = current_shop.id
    if params[:post][:address_select] == "0"
      @post.postal_code = current_shop.postal_code
      @post.address = current_shop.address
    end
    @post.save
    redirect_to shop_posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to shop_post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to shop_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:shop_id, :title, :body, :image, :created_at_gteq, :created_at_lteq_end_of_day, :postal_code, :address, :latitude, :longitude)
  end
end