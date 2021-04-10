require 'rails_helper'

RSpec.describe "新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @book = FactoryBot.create(:book)
  end

  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # 正しい情報を入力してログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_book_path
      # 画像を添付する
      image_path = Rails.root.join('public/images/test_image.png')
      # フォームに情報を入力する
      attach_file('book[image]', image_path)
      fill_in 'book[title]', with: @book.title
      select '漫画', from: 'book[book_category_id]'
      select 'ファンタジー', from: 'book[book_genre_id]'
      fill_in 'book[catch_copy]', with: @book.catch_copy
      fill_in 'book[content]', with: @book.content
      fill_in 'book[highlight]', with: @book.highlight
      # 送信するとBookモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Book.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した内容が存在することを確認する（画像）
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した内容が存在することを確認する（テキスト）
      expect(page).to have_content(@book.title)
    end
  end

  context '新規投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 「投稿する」ボタンを押しても投稿ページではなく、ログインページへ遷移する
      expect(page).to have_content('投稿する')
      click_on('投稿する')
      visit new_user_session_path
    end
  end  
end
