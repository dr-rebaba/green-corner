class AddressesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to @address, notice: 'Dirección creada correctamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to @address, notice: 'Dirección actualizada correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path, notice: 'Dirección eliminada correctamente.'
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:details, :latitude, :longitude)
  end
end