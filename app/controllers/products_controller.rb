class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_bearer_id,
                                    :shipping_origin_id, :shipping_duration_id, :image).merge(user_id: current_user.id)
  end
end
