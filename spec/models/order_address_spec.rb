require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = create(:user)
    @item = build(:item)
    @item.image = fixture_file_upload('/files/test.jpg')
    @order_address = FactoryBot.build(:order_address)
  end
  
  describe '商品購入' do
    context '商品が購入できるとき' do
      it 'building_nameを除く全ての値を正しく入力すれば購入できる' do
      expect(@order_address).to be_valid
      end 
    end
    
    context '商品が購入できないとき' do
      it 'tokenがなければ購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeがなければ購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは-を含まなければ購入できない' do
        @order_address.postal_code = '9990000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeは-の前が３桁、後ろが４桁でなければ購入できない' do
        @order_address.postal_code = '9990-000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeは全角数字では購入できない' do
        @order_address.postal_code = '９９９−００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      
      it 'prefecture_idがなければ購入できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it 'prefecture_idが1だと出品できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityがなければ購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressがなければ購入できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephone_numberがなければ購入できない' do
        @order_address.telephone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは-を含まなければ購入できない' do
        @order_address.telephone_number = '09012345678'
        @order_address.valid?
        binding.pry
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'user_idがなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      
    end
  end

end
