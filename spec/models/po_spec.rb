require 'rails_helper'

RSpec.describe Po, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @po = FactoryBot.build(:po, user_id: user.id, item_id: item.id)
  end
  
    context '商品が購入出来る時' do
      it '全ての値が適切に入力されていれば保存できる' do
        expect(@po).to be_valid
      end

      it '建物名が空でも購入できる' do 
        @po.building = ""
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
        expect(@po.errors.full_messages).to include("Post can't be blank")
      end

      it '3桁ハイフン4桁の半角文字列でないと保存できない' do
        @po.post = '1234567'
        @po.valid?
        expect(@po.errors.full_messages).to include('Post is invalid')
      end

      it '市区町村が紐付いていなければ投稿できない' do
        @po.area_id = 1
        @po.valid?
        expect(@po.errors.full_messages).to include("Area can't be blank")
      end

      it '住所が紐付いていなければ投稿できない' do
        @po.city = ""
        @po.valid?
        expect(@po.errors.full_messages).to include("City can't be blank")
      end

      it '番地が紐付いていなければ投稿できない' do
        @po.address = ""
        @po.valid?
        expect(@po.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が紐付いていなければ投稿できない' do
        @po.tel = ""
        @po.valid?
        expect(@po.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号が9桁以下では登録できない' do
        @po.tel = '123456789'
        @po.valid?
        expect(@po.errors.full_messages).to include('Tel is too short (minimum is 10 characters)')
      end
    
      it '電話番号が12桁以上では登録できない' do
        @po.tel = '123456789012'
        @po.valid?
        expect(@po.errors.full_messages).to include('Tel is too long (maximum is 11 characters)')
      end

      it '電話番号に半角数字以外が含まれている場合登録できない' do 
        @po.tel = '1234５６789１０'
        @po.valid?
        expect(@po.errors.full_messages).to include("Tel is invalid")
      end

      it 'user_idが空だと保存できない' do
        @po.user_id = nil
        @po.valid?
        expect(@po.errors.full_messages).to include("User can't be blank")
      end
  
      it 'item_idが空だと保存できない' do
        @po.item_id = nil
        @po.valid?
        expect(@po.errors.full_messages).to include("Item can't be blank")
      end

  end
end