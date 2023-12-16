class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.create_cart
    @cart_products = @cart.cart_products.includes(:product)
    @total_due = calculate_total_due(@cart_products)
  end

  private

  def calculate_total_due(cart_products)
    cart_products.sum { |cart_product| cart_product.quantity * cart_product.price }
  end
end
