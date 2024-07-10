class PurchasesController < ApplicationController
  
  def index
    @po = Po.new
  end

  def create
    @po = Po.new(po_params)
    if @po.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def po_params
    params.require(:po).permit(:card, :deadline, :security, :post, :prefecture, :city, :adress, :building, :tel)
  end
end
