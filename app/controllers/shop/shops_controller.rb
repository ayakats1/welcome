class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.update(shop_params)
    redirect_to shops_my_page_path
  end

  def unsubscribe
    @shop = current_shop
  end

  def withdraw
    @shop = current_shop
    @shop.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def shop_params
    params.require(:shop).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :shop_name, :shop_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
