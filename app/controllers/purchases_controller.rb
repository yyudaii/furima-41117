class PurchasesController < ApplicationController
  
  def index
  end

  def create
    @po = Po.new
  end


  private

  def メソッド名
    params.permit(指定のカラムを記述する)
  end
end
