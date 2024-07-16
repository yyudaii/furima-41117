class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :tachiiri_kinshi, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @po = Po.new
  end

  def create
    @po = Po.new(po_params)
    if @po.valid?
      pay_pay
      @po.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def po_params
    params.require(:po).permit( :post, :area_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token] )
  end

  def pay_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: po_params[:token],
      currency: 'jpy'
    )
  end

  def tachiiri_kinshi
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
