class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to public_addresses_path
  end

  def update
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postcode)
  end
end
