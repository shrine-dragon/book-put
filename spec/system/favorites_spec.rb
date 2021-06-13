require 'rails_helper'

RSpec.describe 'お気に入り', type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @book = FactoryBot.create(:book, user_id: @user2.id)
  end

  context 'お気に入りに追加・解除ができる時' do
    it 'ログインしている投稿者以外のユーザーは投稿をお気に入りに追加したり、解除したりできる' do
      # 投稿者以外のユーザーでログインする
      sign_in(@user1)
      # 書籍の詳細ページへ遷移する
      visit book_path(@book.id)
      # 詳細ページにお気に入りボタンがあることを確認する
      expect(page).to have_selector '.favorite-btn'
      # クリックするとお気に入りに追加でき、Favoriteモデルのカウントが1上がることを確認する
      expect do
        find(".favorite-btn").click
      end.to change { Favorite.count }.by(1)
      # もう一度クリックするとお気に入りを解除でき、Favoriteモデルのカウントが1下がることを確認する
      expect do
        find(".favorite-btn").click
      end.to change { Favorite.count }.by(-1)
    end
  end

  context 'お気に入りに追加・解除ができない時' do
    it 'ログインしているユーザーは自分の投稿をお気に入りに追加したり、解除したりできない' do
      # 書籍を投稿したユーザーでログインする
      sign_in(@user2)
      # 書籍の詳細ページへ遷移する
      visit book_path(@book.id)
      # 詳細ページにお気に入りボタンがあることを確認する
      expect(page).to have_selector '.favorite-btn'
      # クリックしてもお気に入りに追加できず、Favoriteモデルのカウントも1上がらないことを確認する
      expect do
        find(".favorite-btn").click
      end.to change { Favorite.count }.by(0)
    end

    it 'ログインしていないユーザーは投稿をお気に入りに追加したり、解除したりできない' do
      # トップページへ遷移する
      visit root_path
      # 投稿詳細ページへ遷移する
      visit book_path(@book.id)
      # 詳細ページにお気に入りボタンがないことを確認する
      expect(page).to have_no_selector '.favorite-btn'
    end
  end
end