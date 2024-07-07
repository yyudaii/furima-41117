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
end
