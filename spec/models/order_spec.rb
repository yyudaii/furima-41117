require 'rails_helper'

RSpec.describe Order, type: :model do
  before do 
    



  context '商品が購入出来る時' do
    it '全ての値が適切に入力されていれば保存できる' do
      expect(@po).to be_valid
    end
  end
  

  context '商品が購入できない時' do
    it "tokenが空では登録できないこと" do
      @po.token = nil
      @po.valid?
      expect(@po.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が紐付いていなければ投稿できない' do
      @po.post = nil
      @po.valid?
      expect(@po.errors.full_messages).to include('Post must exist')
    end

    it '市区町村が紐付いていなければ投稿できない' do
      @po.area = nil
      @po.valid?
      expect(@po.errors.full_messages).to include('Area_id must exist')
    end

    it '番地が紐付いていなければ投稿できない' do
      @po.address = nil
      @po.valid?
      expect(@po.errors.full_messages).to include('City must exist')
    end

    it '電話番号が紐付いていなければ投稿できない' do
      @po.tel = nil
      @po.valid?
      expect(@po.errors.full_messages).to include('Tel must exist')
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @po.post = nil
      @po.valid?
      expect(@po.errors.full_messages).to include('Post must exist')
    end
  end
end
