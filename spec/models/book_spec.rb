require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
    sleep 0.1
  end
  describe 'アウトプット投稿機能' do
    context '投稿内容が保存できる時' do
      it '必須項目が全て正しく入力・選択されていれば保存できる' do
        expect(@book).to be_valid
      end

      it '見どころが入力されていなくても保存できる' do
        @book.highlight = ''
        expect(@book).to be_valid
      end
    end

    context '投稿内容を保存できない時' do
      it '画像が選択されていないと保存できない' do
        @book.image = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('画像を添付してください')
      end

      it 'タイトルが入力されていないと保存できない' do
        @book.title = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('タイトルを入力してください')
      end

      it 'タイトルが51文字以上だと保存できない' do
        @book.title = 'a' * 51
        @book.valid?
        expect(@book.errors.full_messages).to include('タイトルは50文字以内で入力してください')
      end

      it '本の種類が選択されていないと保存できない' do
        @book.category_id = 0
        @book.valid?
        expect(@book.errors.full_messages).to include('種類を選択してください')
      end

      it '本のジャンルが選択されていないと保存できない' do
        @book.genre_id = 0
        @book.valid?
        expect(@book.errors.full_messages).to include('ジャンルを選択してください')
      end

      it 'キャッチコピーが入力されていないと保存できない' do
        @book.catch_copy = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('キャッチコピーを入力してください')
      end

      it '内容が入力されていないと保存できない' do
        @book.content = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('内容を入力してください')
      end

      it '内容が1001文字以上だと保存できない' do
        @book.content = 'a' * 1001
        @book.valid?
        expect(@book.errors.full_messages).to include('内容は1000文字以内で入力してください')
      end

      it 'userが紐づいていないと保存できない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
