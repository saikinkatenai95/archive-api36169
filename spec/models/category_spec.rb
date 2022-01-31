require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryBot.build(:category)
  end

  describe 'カテゴリー新規登録項目' do
    context '新規登録できるとき'do
      it 'nameが存在かつ重複していなければ登録できる' do
        expect(@category).to be_valid
      end
    end
    
    context '新規登録できないとき'do
      it 'nameが空では登録できない' do
        @category.name = ''
        @category.valid?
        expect(@category.errors.full_messages).to include("Name can't be blank")
      end
      it '重複したnameが存在する場合は登録できない' do
        @category.save
        another_name = FactoryBot.build(:category)
        another_name.name = @category.name
        another_name.valid?
        expect(another_name.errors.full_messages).to include("Name has already been taken")
      end
    end
  end
end
