require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = create(:user)
    user = @user
    @item = build(:item)
    @item.image = fixture_file_upload('/files/test.jpg')
  end

  describe '商品出品' do
    context '商品が出品できるとき' do
      it 'imageとnameとexplanasion、item_fee、category、state、prefecture、shipping_fee_burden、delivery_dayがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがないと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字以上だと出品できない' do
        @item.name = 'ああああああああああああああああああああああああああああああああああああああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'expilationがないと出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idがないと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'state_idがないと出品できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end
      it 'state_idが1だと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it 'shipping_fee_burden_idがないと出品できない' do
        @item.shipping_fee_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee burden is not a number')
      end
      it 'shipping_fee_burden_idが1だと出品できない' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee burden must be other than 1')
      end
      it 'prefecture_idがないと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'delivery_day_idがないと出品できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day is not a number')
      end
      it 'delivery_day_idが1だと出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end
      it 'item_feeがないと出品できない' do
        @item.item_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item fee can't be blank", 'Item fee is invalid',
                                                      'Item fee は300円から9999999円の範囲で入力してください')
      end
      it 'item_feeが300未満だとと出品できない' do
        @item.item_fee = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee は300円から9999999円の範囲で入力してください')
      end
      it 'item_feeが10000000以下でないと出品できない' do
        @item.item_fee = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee は300円から9999999円の範囲で入力してください')
      end
      it 'item_feeが全角数字では出品できない' do
        @item.item_fee = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee は300円から9999999円の範囲で入力してください')
      end
      it 'item_feeが全角英字では出品できない' do
        @item.item_fee = 'ＡＡＡ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee は300円から9999999円の範囲で入力してください')
      end
      it 'item_feeが半角英字では出品できない' do
        @item.item_fee = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee は300円から9999999円の範囲で入力してください')
      end
    end
  end
end
