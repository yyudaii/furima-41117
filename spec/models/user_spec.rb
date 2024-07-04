require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上でないと登録できない' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = '12345６'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '姓（全角）が空だと登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name is invalid')
    end

    it '名（全角）が空だと登録できない' do
      @user.myouji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Myouji can't be blank")
    end

    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.myouji = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('Myouji is invalid')
    end

    it '姓（カナ）が空だと登録できない' do
      @user.name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana can't be blank")
    end

    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.name_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name kana is invalid')
    end

    it '名（カナ）が空だと登録できない' do
      @user.myouji_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Myouji kana can't be blank")
    end

    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.myouji_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Myouji kana is invalid')
    end

    it '生年月日が空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
