class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :find_item, only: [:show, :edit, :update] 
  
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

  def show
  end

  def edit
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :shipping_fee_burden_id, :prefecture_id,
                                 :delivery_day_id, :item_fee).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
