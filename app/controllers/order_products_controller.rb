class OrderProductsController < ApplicationController
  def create
    @order_product = OrderProduct.new(order_product_params)
    if @order_product.save
      redirect_to @order_product.order
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:product_id, :order_id, :quantity, :price)
  end
end
