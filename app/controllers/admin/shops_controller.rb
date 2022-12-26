class Admin::ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
    @posts = Post.where(shop_id: @shop.id).order(created_at: :desc)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to admin_shop_path(@shop)
  end

  private

  def shop_params
    params.require(:shop).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :shop_name, :shop_name_kana, :postal_code, :address, :opening_hours, :regular_holiday, :parking, :latitude, :longitude, :telephone_number, :email, :genre, :is_deleted)
  end
end
