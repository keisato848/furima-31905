class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
  end

end
