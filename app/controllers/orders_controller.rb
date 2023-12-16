class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create
    @cart = current_user.cart
    if current_user.cart.cart_products.empty?
      flash[:alert] = "No se puede crear una orden con un carrito vacío."
      redirect_to cart_path(@cart)
    else
      total_virtual_cash = @cart.cart_products.sum(:virtual_cash)
      total_amount = @cart.cart_products.sum(:price)

      @order = Order.new(
        user: current_user,
        status: 0,
        purchase_date: Date.today,
        virtual_cash: total_virtual_cash,
        amount: total_amount
      )

      if @order.save
        create_order_products(@order, @cart.cart_products)
        @cart.destroy
        redirect_to order_path(@order), notice: 'La orden se ha creado correctamente.'
      else
        redirect_to cart_path, alert: 'No se logró completar tu orden.'
      end
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_products = @order.order_products.includes(:product)
    @total_due = calculate_total_due(@order_products)
  end

  def cancel
    @order = current_user.orders.find(params[:id])

    if @order.status == 0
      @order.update(status: 2)
      flash[:notice] = 'La orden se ha cancelado correctamente.'
    else
      flash[:alert] = 'No se puede cancelar una orden que ya ha sido procesada.'
    end

    redirect_to orders_path
  end

  helper_method :display_order_status, :display_order_status_class

  private

  def calculate_total_due(order_products)
    order_products.sum { |order_product| order_product.quantity * order_product.price }
  end

  def create_order_products(order, cart_products)
    cart_products.each do |cart_product|
      OrderProduct.create(
        order: order,
        product: cart_product.product,
        quantity: cart_product.quantity,
        price: cart_product.price
      )
    end
  end

  def display_order_status(status)
    case status
    when 0
      'Pendiente'
    when 1
      'Entregada'
    when 2
      'Cancelada'
    else
      'Otro'
    end
  end
end

def display_order_status_class(status)
  case status
  when 'pending'
    'table-warning'
  when 'processed'
    'table-success'
  when 'shipped'
    'table-primary'
  when 'delivered'
    'table-info'
  when 'cancelled'
    'table-danger'
  else
    'table-light'
  end
end
