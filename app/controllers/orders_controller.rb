class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :redirect_root
  before_action :expect_seller
  before_action :expect_sold_out

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
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

  def find_item
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

  def expect_seller
    find_item
    redirect_to root_path unless current_user.id = !@item.user_id
  end

  def expect_sold_out
    find_item
    redirect_to root_path if Order.find_by(item_id: @item.id)
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end
end
