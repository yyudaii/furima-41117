class OrdersController < ApplicationController
  def index
    @po = Po.new
    @item = Item.find(params[:item_id])
  end

  def create
    @po = Po.new(po_params)
    @item = Item.find(params[:item_id])
    if @po.valid?
      @po.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def po_params
    params.require(:po).permit(:image, :card, :deadline, :security, :post, :area_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id] )
  end
end
