require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '必須項目が入力されていれば保存できる' do
        expect(@product).to be_valid
      end
      it '商品名が1文字で保存できる' do
        @product.name = Faker::Lorem.characters(number: 1)
        expect(@product).to be_valid
      end
      it '商品名が40文字で保存できる' do
        @product.name = Faker::Lorem.characters(number: 40)
        expect(@product).to be_valid
      end
      it '商品説名が1文字で保存できる' do
        @product.description = Faker::Lorem.characters(number: 1)
        expect(@product).to be_valid
      end
      it '商品説名が1000文字で保存できる' do
        @product.description = Faker::Lorem.characters(number: 1000)
        expect(@product).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像が空では保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では保存できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が41文字以上では保存できない' do
        @product.name = Faker::Lorem.characters(number: 41)
        @product.valid?
        expect(@product.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it '商品の説名が空では保存できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it '商品の説名が1001文字以上では保存できない' do
        @product.description = Faker::Lorem.characters(number: 1001)
        @product.valid?
        expect(@product.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end
      it 'カテゴリーが---では保存できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が未選択では保存できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が未選択では保存できない' do
        @product.shipping_fee_bearer_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee bearer can't be blank")
      end
      it '発送元の地域が未選択では保存できない' do
        @product.shipping_origin_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it '発送までの日数が未選択では保存できない' do
        @product.shipping_duration_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping duration can't be blank")
      end
      it '販売価格が空欄では保存できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が全角では保存できない' do
        @product.price = "３００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は300~9,999,999までの半角整数で入力してください")
      end
      it '販売価格が300円未満では保存できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price は300~9,999,999までの半角整数で入力してください')
      end
      it '販売価格が9999999円以上では保存できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price は300~9,999,999までの半角整数で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
