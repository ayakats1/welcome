class Shop::InformationsController < ApplicationController
  def index
    @informations = Information.all
  end

  def show
    @information = Information.find(params[:id])
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    @information.shop_id = current_shop.id
    @information.save
    redirect_to information_path(@information.id)
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    @information.update(information_params)
    redirect_to information_path(@information.id)
  end

  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    redirect_to informations_path
  end

  private

  def information_params
    params.require(:information).permit(:shop_id, :title, :body, :image, :created_at_gteq, :created_at_lteq_end_of_day)
  end
end