class Shop::PostsController < ApplicationController
  def index
    #@posts = Post.where("created_at_lteq_end_of_day >= ?", Date.today).order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews.order(created_at: :desc)
    Time::DATE_FORMATS[:datetime_jp] = '%Y/ %m/ %d'
  end

  def new
    @shop = current_shop
    @post = Post.new
  end

  def create
    @shop = current_shop
    @post = @shop.posts.build(post_params)
    if @post.save
      redirect_to shop_posts_path, notice: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if current_shop.id != @post.shop_id
      flash[:error] = "投稿者しか編集出来ません"
      redirect_to shop_post_path(@post)
    end
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
    params.require(:post).permit(:shop_id, :title, :body, :image, :created_at_gteq, :created_at_lteq_end_of_day, :postal_code, :address, :latitude, :longitude, :address_select)
  end
end