require 'rails_helper'

RSpec.describe '好評価', type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @book = FactoryBot.create(:book, user_id: @user2.id)
  end

  context '好評価・好評価の解除ができる時' do
    it 'ログインしている投稿者以外のユーザーは投稿を好評価したり、解除したりできる' do
      # 投稿者以外のユーザーでログインする
      sign_in(@user1)
      # 書籍の詳細ページへ遷移する
      visit book_path(@book.id)
      # 詳細ページに好評価ボタンがあることを確認する
      expect(page).to have_selector '.like-btn'
      # クリックすると好評価でき、Likeモデルのカウントが1上がることを確認する
      find(".like-btn").click
      change { Like.count }.by(1)
      # もう一度クリックすると好評価を解除でき、Likeモデルのカウントが1下がることを確認する
      find(".like-btn").click
      change { Like.count }.by(-1)
    end
  end

  context '好評価・好評価の解除ができない時' do
    it 'ログインしているユーザーは自分の投稿を好評価したり、解除したりできない' do
      # 書籍を投稿したユーザーでログインする
      sign_in(@user2)
      # 書籍の詳細ページへ遷移する
      visit book_path(@book.id)
      # 詳細ページに好評価ボタンがあることを確認する
      expect(page).to have_selector '.like-btn'
      # クリックしても好評価できず、Likeモデルのカウントも1上がらないことを確認する
      find(".like-btn").click
      change { Like.count }.by(0)
    end

    it 'ログインしていないユーザーは投稿を好評価したり、解除したりできない' do
      # トップページへ遷移する
      visit root_path
      # 投稿詳細ページへ遷移する
      visit book_path(@book.id)
      # 詳細ページに好評価ボタンがないことを確認する
      expect(page).to have_no_selector '.like-btn'
    end
  end
end