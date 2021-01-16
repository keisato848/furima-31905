class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_ba203a062a0431b904cc30ee"
      Payjp::Charge.create(
        amount: @item.item_fee,
        card: @order_address.token,
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

end
