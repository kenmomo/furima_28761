require 'rails_helper'

RSpec.describe InformationAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user.id)
      @user2 = FactoryBot.create(:user)
      @information_address = FactoryBot.build(:information_address, item_id: @item.id, user_id: @user2.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@information_address).to be_valid
    end
    it 'buildding_nameが空でも保存できること' do
      @information_address.buildding_name = nil
      expect(@information_address).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @information_address.postal_code = nil
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @information_address.prefecture_id = nil
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("Prefecture is not a number")
    end
    it 'city_nameが空だと保存できないこと' do
      @information_address.city_name = nil
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("City name can't be blank")
    end
    it 'block_numberが空だと保存できないこと' do
      @information_address.block_number = nil
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("Block number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @information_address.phone_number = nil
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @information_address.token = nil
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeに-が含まれていないと保存できないこと' do
      @information_address.postal_code = '0000000'
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("Postal code is invalid")
    end
    it 'phone_numberは11桁以上だと保存できないこと' do
      @information_address.phone_number = '00000000000000'
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'prefecture_idが0だと保存できないこと' do
      @information_address.prefecture_id = 0
      @information_address.valid?
      expect(@information_address.errors.full_messages).to include("Prefecture must be other than 0")
    end

  end
end