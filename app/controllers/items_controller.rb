class ItemsController < ApplicationController
  def index 
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.seve
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :shipping_fee_id, :area_id, :delay_id)
  end
end
