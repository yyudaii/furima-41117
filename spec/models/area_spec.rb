require 'rails_helper'

RSpec.describe Area, type: :model do
  it 'areaが空では登録できない' do
    @item.area = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("area can't be blank")
  end
end
