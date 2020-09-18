require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)

    end

    it '全てのフォームが存在していれば保存できること' do
      expect(@item).to be_valid
    end

    it 'item_name が空では保存できないこと' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'contentが空では保存できないこと' do
      @item.content = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end
    it 'category_idが空では保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end
    it 'condition_idが空では保存できないこと' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end
    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'delivery_burden_idが空では保存できないこと' do
      @item.delivery_burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery burden is not a number')
    end
    it 'delivery_area_idが空では保存できないこと' do
      @item.delivery_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery area is not a number')
    end
    it 'delivery_days_idが空では保存できないこと' do
      @item.delivery_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery days is not a number')
    end
    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it '価格の範囲が、~¥300だと保存できないこと' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、¥9999999~だと保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格は半角数字でないとほぞんできないこと' do
      @item.price = 'aaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'category_idが1では保存できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'condition_idが1では保存できないこと' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it 'delivery_burden_idが1では保存できないこと' do
      @item.delivery_burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery burden must be other than 1')
    end
    it 'delivery_area_idが1では保存できないこと' do
      @item.delivery_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
    end
    it 'delivery_days_idが1では保存できないこと' do
      @item.delivery_days_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery days must be other than 1')
    end
  end
end
