require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    # 正常系
    context '出品登録がうまくいくとき' do
      it '全ての項目の入力されると登録可能' do
        @item = FactoryBot.build(:item)
        expect(@item).to be_valid
      end
    end

    # 異常系
    context '出品登録がうまくいかないとき' do
      it 'imageが空だと保存されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存されない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'textが空だと保存されない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idが空だと保存されない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'item_status_idが空だと保存されない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status is not a number')
      end

      it 'delivery_charge_idが空だと保存されない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge is not a number')
      end

      it 'prefecture_idが空だと保存されない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'shopping_day_idが空だと保存されない' do
        @item.shopping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping day is not a number')
      end

      it 'priceが空だと保存されない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが大文字の数字の場合、保存されない' do
        @item.price = '５６７３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300以下の数字の場合、保存されない' do
        @item.price = '115'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it 'priceが9,999,999以上の数字の場合、保存されない' do
        @item.price = '1,000,000,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
