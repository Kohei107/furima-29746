require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の登録' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it '郵便番号が空だと登録できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code Postal code input correctly')
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code Postal code input correctly')
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture Select')
    end
    it 'municipalityが空だと登録できない' do
      @order_address.municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'street_numberが空だと登録できない' do
      @order_address.street_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street number can't be blank")
    end
    it 'buildingは空でも登録できる' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
    it 'phone_numberが空だと登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end
    it 'phone_numberが11桁以上だと登録できない' do
      @order_address.phone_number = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages). to include('Phone number is invalid')
    end
    it 'tokenが空だと登録できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
