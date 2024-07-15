class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ryakushiki_eisyou, only: [:show, :edit, :update, :destroy]
  before_action :jikatobi_kinshi, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
    @po = Po.new
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

  def show
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless Order.exists?(user_id: current_user.id, item_id: @item.id)
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :image, :name, :message, :category_id, :condition_id, :fee_id, :area_id, :delay_id, :price)
  end

  def ryakushiki_eisyou
    @item = Item.find(params[:id])
  end

  def jikatobi_kinshi
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
