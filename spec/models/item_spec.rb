require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品情報の登録' do
    it 'すべての情報が正しいフォーマットで入力されていれば登録できる' do
      expect(@item).to be_valid
    end
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'detailが空だと登録できない' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end
    it 'category_idが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it 'category_idが0だと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    it 'condition_idが空だと登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end
    it 'shipping_fee_idが空だと登録できない' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee Select')
    end
    it 'shipping_place_idが空だと登録できない' do
      @item.shipping_place_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping place Select')
    end
    it 'prep_time_idが空だと登録できない' do
      @item.prep_time_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Prep time Select')
    end
    it 'priceが空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price Out of setting range")
    end
    it 'priceが300円未満だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが9,999,999円を超過すると登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが全角だと登録できない' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end
