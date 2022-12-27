require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品が出品出来るとき' do
    context '商品が出品出来るとき' do
      it '全ての記入が出来ていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品出来ない場合' do
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'deliveryが空では登録できない' do
        @item.delivery = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageがないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'commodity_conditionを選択していない場合登録できない' do
        @item.commodity_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Commodity condition must be other than 1')
      end
      it 'shipping_chargeを選択していない場合登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end
      it 'region_of_originを選択していない場合登録できない' do
        @item.region_of_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Region of origin must be other than 1')
      end
      it 'days_to_shipを選択していない場合登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it 'categoryを選択していない場合登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'priceが英字の場合は登録できない' do
        @item.price = 'ytytyt'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが全角の場合は登録できない' do
        @item.price = '９００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが¥300未満の場合は登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが¥9,999,999以上の場合は登録できない' do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
