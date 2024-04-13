require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入者情報の保存' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_history_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_history_address.building = ''
        expect(@purchase_history_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空だと購入できない' do
        @purchase_history_address.postal_code = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_history_address.postal_code = '1234567'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'cityが空だと購入できない' do
        @purchase_history_address.city = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @purchase_history_address.block = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'telが空だと購入できない' do
        @purchase_history_address.tel = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telは9桁以下だと購入できない' do
        @purchase_history_address.tel = '123456789'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'telは12桁以上だと購入できない' do
        @purchase_history_address.tel = '123456789123'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'telは半角数字以外が含まれている場合だと購入できない' do
        @purchase_history_address.tel = '090-1234'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'city_idに「1」が選択されている場合は出品できない' do
        @purchase_history_address.prefecture_id = '1'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @purchase_history_address.token = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @purchase_history_address.user_id = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @purchase_history_address.item_id = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
