require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @order_address_form = FactoryBot.build(:order_address_form,user_id: @user.id,item_id: @item.id)
    end

    # 正常系
    context '購入がうまくいくとき' do
      it '全ての項目の入力されると登録可能' do
        expect(@order_address_form).to be_valid
      end

      it 'buildingは空でも保存できる' do
        @order_address_form.building = nil
        expect(@order_address_form).to be_valid
      end
    end

    # 異常系
    context '購入がうまくいかないとき' do
      it 'tokenが空では登録できないこと' do
        @order_address_form.token = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_numberが空の場合、保存できない' do
        @order_address_form.post_number = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Post number can't be blank")
      end

      it 'post_numberに半角のハイフンを含んでいない場合、保存できない' do
        @order_address_form.post_number = '12345678'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Post number is invalid')
      end

      it 'post_numberが全角の場合、保存できない' do
        @order_address_form.post_number = '０００ー００００'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Post number is invalid')
      end

      it 'prefecture_idが空だと保存されない' do
        @order_address_form.prefecture_id = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'cityは空だと保存されない' do
        @order_address_form.city = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("City can't be blank")
      end

      it 'phone_numberは空だと保存されない' do
        @order_address_form.phone_number = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角の場合、保存できない' do
        @order_address_form.post_number = '１２３４５６７８９１０'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Post number is invalid')
      end

      it 'phone_numberにハイフンが含まれている場合、保存できない' do
        @order_address_form.post_number = '012-3456-7890'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Post number is invalid')
      end

      it 'phone_numberは12桁以上の場合、保存できない' do
        @order_address_form.phone_number = '012345678901234'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
