class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :shipping_fee_burden_id, :prefecture_id,
                                 :delivery_day_id, :item_fee).merge(user_id: current_user.id)
  end
end
