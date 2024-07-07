class ItemsController < ApplicationController
  def index 
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
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
    params.require(:item).permit(:user_id, :image, :name, :message, :category_id, :condition_id, :fee_id, :area_id, :delay_id, :price )
  end
end
