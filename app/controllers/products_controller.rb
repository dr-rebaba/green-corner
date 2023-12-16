class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :index, :show, :edit, :destroy ]
  # skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  def index
    @products = Product.all
    if params[:query].present?
      @products = @products.search_by_title_and_description(params[:query])
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    #@review = Review.new(product: @product)
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :details, :quantity, :price, :virtual_cash, :photo)
  end
end
