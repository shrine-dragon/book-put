require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  before do
    @questionnaire = FactoryBot.build(:questionnaire)
  end

  describe 'ユーザー新規登録2ページ目' do
    context 'アンケート内容が保存できて、新規登録できる時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@questionnaire).to be_valid
      end
    end

    context 'アンケート内容が保存できず、新規登録できない時' do
      it '本の種類がが空だと保存できない' do
        @questionnaire.book_category_id = 0
        @questionnaire.valid?
        expect(@questionnaire.errors.full_messages).to include('種類を選択してください')
      end

      it '本のジャンルが空だと保存できない' do
        @questionnaire.book_genre_id = 0
        @questionnaire.valid?
        expect(@questionnaire.errors.full_messages).to include('ジャンルを選択してください')
      end

      it '購入場所が空だと保存できない' do
        @questionnaire.purchase_place_id = 0
        @questionnaire.valid?
        expect(@questionnaire.errors.full_messages).to include('購入場所を選択してください')
      end

      it '媒体が空だと保存できない' do
        @questionnaire.reading_type_id = 0
        @questionnaire.valid?
        expect(@questionnaire.errors.full_messages).to include('媒体を選択してください')
      end
    end
  end
end
