class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :redirect_if_own_product, only: [:index, :create]
  before_action :redirect_if_purchased, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, product_id: params[:product_id]
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def redirect_if_own_product
    return unless current_user.id == @product.user_id

    redirect_to root_path
  end

  def redirect_if_purchased
    redirect_to root_path if @product.order.present?
  end
  
end
