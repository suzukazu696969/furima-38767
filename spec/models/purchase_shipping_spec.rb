require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @purchase_shipping = FactoryBot.build(:purchase_shipping)
  end

  context '内容に問題ない場合' do
    it '全ての記入が出来ていれば購入できる' do
      expect(@purchase_shipping).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では購入ができないこと' do
      @purchase_shipping.postal_code = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'tokenが空では購入できないこと' do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end

    it 'cityが空では購入できないこと' do
      @purchase_shipping.city = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesが空では購入できないこと' do
      @purchase_shipping.addresses = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Addresses can't be blank")
    end

    it 'phone_numberが空では購入できないこと' do
      @purchase_shipping.phone_number = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'region_of_originを選択していない場合購入できない' do
      @purchase_shipping.region_of_origin_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Region of origin must be other than 1')
    end
    it 'postal_codeが英字の場合は購入できない' do
      @purchase_shipping.postal_code = 'yty-ptyt'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid')
    end

    it 'postal_codeが全角の場合は購入できない' do
      @purchase_shipping.postal_code = '１６９−６６６６'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid')
    end

    it 'postal_codeがハイフン無しの場合は購入できない' do
      @purchase_shipping.postal_code = '1355666'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid')
    end

    it 'phone_numberが全角の場合は購入できない' do
      @purchase_shipping.phone_number = '０９０９８７６６７８９'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが英字の場合は購入できない' do
      @purchase_shipping.phone_number = 'rtreyywettr'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが10桁未満の場合は購入できない' do
      @purchase_shipping.phone_number = '090123443'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが11桁以上の場合は購入できない' do
      @purchase_shipping.phone_number = '090098776543'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
