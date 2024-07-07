require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it "nameが空では登録できない" do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it "messageが空では登録できない" do
    @item.message = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Message can't be blank")
  end

  it "category_idが1では登録できない" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
    
  it "condition_idが1では登録できない" do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
    
  it "fee_idが1では登録できない" do
    @item.fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Fee can't be blank")
  end
    
  it "area_idが1では登録できない" do
    @item.area_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Area can't be blank")
  end
    
  it "delay_idが1では登録できない" do
    @item.delay_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delay can't be blank")
  end
    
  it "priceが300未満では登録できない" do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end
    
  it "priceが9999999より大きいと登録できない" do
    @item.price = 10_000_000
    @item.valid?
  expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999") 
  end

end