class CartProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @cart = current_user.cart || current_user.create_cart
    @cart_product = @cart.cart_products.find_or_initialize_by(product: @product)

    if @cart_product.new_record?
      @cart_product.assign_attributes(quantity: 1, price: @product.price)
    else
      @cart_product.quantity += 1
    end

    if @cart_product.save
      redirect_to cart_path(@cart), notice: 'El producto se añadió a tu carrito correctamente.'
    else
      render :new, status: :unprocessable_entity, alert: 'No se logró añadir el producto a tu carrito.'
    end
  end

  def update_quantity
    @cart_product = current_user.cart.cart_products.find(params[:id])
    new_quantity = params[:quantity].to_i

    if new_quantity.positive?
      @cart_product.update(quantity: new_quantity)
    else
      @cart_product.destroy
    end
    redirect_to cart_path
  end

  def destroy
    @cart_product = current_user.cart.cart_products.find(params[:id])
    @cart_product.destroy
    redirect_to cart_path, notice: 'Se quitó el producto de tu carrito.'
  end
end
