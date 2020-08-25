require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入時のaddressデータについて' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buy_address).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @buy_address.token = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_numが空だと保存できないこと' do
      @buy_address.post_num = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post num can't be blank")
    end
    it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buy_address.post_num = '1234567'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post num Input correctly")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @buy_address.prefecture_id = 1
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Prefecture Select")
    end
    it 'cityは空だと保存できないこと' do
      @buy_address.city = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numは空だと保存できないこと' do
      @buy_address.house_num = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("House num can't be blank")
    end
    it 'apart_nameは空でも保存できること' do
      @buy_address.apart_name = nil
      # binding.pry
      expect(@buy_address).to be_valid
    end
    it 'telが空だと保存できないこと' do
      @buy_address.tel = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Tel can't be blank")
    end
    it 'telにはハイフンが有ると保存できないこと' do
      @buy_address.tel = 1234-5678
      @buy_address.valid?
      # binding.pry
      expect(@buy_address.errors.full_messages).to include("Tel is invalid. Include hyphen(-)")
    end
    it 'telが12桁以上であると保存できないこと' do
      @buy_address.tel = 123456789101
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Tel can't be blank")
    end
  end
end
