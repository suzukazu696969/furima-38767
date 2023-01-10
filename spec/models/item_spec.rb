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
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'deliveryが空では登録できない' do
        @item.delivery = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'imageがないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を選択してください")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'commodity_conditionを選択していない場合登録できない' do
        @item.commodity_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'shipping_chargeを選択していない場合登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'region_of_originを選択していない場合登録できない' do
        @item.region_of_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送地域を入力してください")
      end
      it 'days_to_shipを選択していない場合登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'categoryを選択していない場合登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'priceが英字の場合は登録できない' do
        @item.price = 'ytytyt'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが全角の場合は登録できない' do
        @item.price = '９００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが¥300未満の場合は登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'priceが¥9,999,999以上の場合は登録できない' do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
    end
  end
end
