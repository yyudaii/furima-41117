require 'rails_helper'

RSpec.describe Condition, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it 'conditionが空では登録できない' do
    @item.condition = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
end