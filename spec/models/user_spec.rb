require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'すべての情報が正しいフォーマットで入力されていれば登録できる' do
      expect(@user). to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages). to include('Email has already been taken')
    end
    it '@が含まれていないメールアドレスは登録できない' do
      @user.email = 'kkkgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", 'Password  Include both letters and numbers')
    end
    it 'passwordが５文字以下であれば登録できない' do
      @user.password = 'a0000'
      @user.password_confirmation = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages). to include('Password is too short (minimum is 6 characters)', 'Password  Include both letters and numbers')
    end
    it 'passwordが英字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages). to include('Password  Include both letters and numbers')
    end
    it 'passwordが数字のみだと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages). to include('Password  Include both letters and numbers')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages). to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages). to include("Family name can't be blank", 'Family name Full-width characters.')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages). to include("First name can't be blank", 'First name Full-width characters.')
    end
    it 'family_nameとfirst_nameが全角日本語でないと登録できない' do
      @user.family_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages). to include('Family name Full-width characters.')
    end
    it 'first_nameが全角日本語でないと登録できない' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages). to include('First name Full-width characters.')
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages). to include("Family name kana can't be blank", 'Family name kana Full-width katakana characters.')
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages). to include("First name kana can't be blank", 'First name kana Full-width katakana characters.')
    end
    it 'family_name_kanaが全角カタカナでないと登録できない' do
      @user.family_name_kana = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages). to include('Family name kana Full-width katakana characters.')
    end
    it 'first_name_kanaが全角カタカナでないと登録できない' do
      @user.first_name_kana = 'taro'
      @user.valid?
      expect(@user.errors.full_messages). to include('First name kana Full-width katakana characters.')
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages). to include("Birthday can't be blank")
    end
  end
end
