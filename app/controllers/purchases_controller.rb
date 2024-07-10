class PurchasesController < ApplicationController
  
  def index
    @po = Po.new(po_params)
  end

  def create
    @po = Po.new
  end


  private

  def po_params
    params.permit(po_params)
  end
end
