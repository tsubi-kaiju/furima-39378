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
      pay_product
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token])
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

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAYJPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product.price,               # 商品の値段
      card: order_params[:token],           # カードトークン
      currency: 'jpy'                       # 通貨の種類（日本円）
    )
  end
end
