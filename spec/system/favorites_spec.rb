require 'rails_helper'

RSpec.describe 'お気に入り', type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @book = FactoryBot.create(:book, user_id: @user2.id)
  end

  context 'お気に入り追加ができる時' do
    it '投稿者以外のユーザーは投稿をお気に入りに追加できる' do
      # 投稿者以外のユーザーでログインする
      sign_in(@user1)
      # 書籍の詳細ページへ遷移する
      visit book_path(@book.id)
    end
  end
end