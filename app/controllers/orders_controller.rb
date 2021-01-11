class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    # binding.pry
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private

  def address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number)
  end

end
