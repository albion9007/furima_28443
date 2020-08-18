require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品を出品する時' do
      context '出品が出来た時' do
        it "image, item_name, item_explain, category_id, 
            quality_id, deliveryfee_id, shipplace_id, 
            shipday_id, price が存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end

      context '出品が上手くいかない時' do

        it "imageが空では出品出来ない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        
        it "item_nameが空では出品出来ない" do
          @item.item_name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        
        it "item_explainが空では出品出来ない" do
          @item.item_explain = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explain can't be blank")
        end

        it "category_idが---では出品出来ない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end

        it "quality_idが---では出品出来ない" do
          @item.quality_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include( "Quality Select" )
        end

        it "deliveryfee_idが---では出品出来ない" do
          @item.deliveryfee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include( "Deliveryfee Select" )
        end

        it "shipplace_idが---では出品出来ない" do
          @item.shipplace_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include( "Shipplace Select" )
        end

        it "shipday_idが---では出品出来ない" do
          @item.shipday_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include( "Shipday Select" )
        end

        it "priceが空では登録できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "価格が半角で入力されていなければ出品出来ない" do
          @item.price = "５００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Half-width number")
        end

        it "価格の範囲が、¥300~¥9,999,999の間でなければ出品出来ない" do
          @item.price = "200"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end

        it "価格の範囲が、¥300~¥9,999,999の間でなければ出品出来ない" do
          @item.price = "100000000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end

      end
    end
  end
end
