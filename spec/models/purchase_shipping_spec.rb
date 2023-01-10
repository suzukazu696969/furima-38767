require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @user, item_id: @item)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it '全ての記入が出来ていれば購入できる' do
      expect(@purchase_shipping).to be_valid
    end

    it '建物が記入されていなくても登録できる' do
      @purchase_shipping.building = nil
      expect(@purchase_shipping).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では購入ができないこと' do
      @purchase_shipping.postal_code = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'tokenが空では購入できないこと' do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("クレジットカード情報を入力してください")
    end

    it 'cityが空では購入できないこと' do
      @purchase_shipping.city = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("市・区・町・村を入力してください")
    end

    it 'addressesが空では購入できないこと' do
      @purchase_shipping.addresses = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空では購入できないこと' do
      @purchase_shipping.phone_number = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end

    it 'user_idが空では購入できないこと' do
      @purchase_shipping.user_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Userを入力してください")
    end

    it 'item_idが空では購入できないこと' do
      @purchase_shipping.item_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Itemを入力してください")
    end

    it 'region_of_originを選択していない場合購入できない' do
      @purchase_shipping.region_of_origin_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("都道府県を入力してください")
    end
    it 'postal_codeが英字の場合は購入できない' do
      @purchase_shipping.postal_code = 'yty-ptyt'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'postal_codeが全角の場合は購入できない' do
      @purchase_shipping.postal_code = '１６９−６６６６'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'postal_codeがハイフン無しの場合は購入できない' do
      @purchase_shipping.postal_code = '1355666'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'phone_numberが全角の場合は購入できない' do
      @purchase_shipping.phone_number = '０９０９８７６６７８９'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end

    it 'phone_numberが英字の場合は購入できない' do
      @purchase_shipping.phone_number = 'rtreyywettr'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end

    it 'phone_numberが10桁未満の場合は購入できない' do
      @purchase_shipping.phone_number = '090123443'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end

    it 'phone_numberが12桁以上の場合は購入できない' do
      @purchase_shipping.phone_number = '090098776543'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end
  end
end
