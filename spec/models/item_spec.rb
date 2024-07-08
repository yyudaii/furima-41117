require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができる時' do
    it '全ての値が適切に入力されていれば保存できる' do
      expect(@item).to be_valid
    end
  end



  context '商品出品ができない時' do
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
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
  
    it "priceが空では出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it "価格に半角数字以外が含まれている場合は出品できない" do
      @item.price = '１23abc'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
      
    it "priceが300未満では登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
      
    it "priceが9999999より大きいと登録できない" do
      @item.price = 10_000_000
      @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9,999,999") 
    end
  end
end