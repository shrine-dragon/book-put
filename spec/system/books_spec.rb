require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @book = FactoryBot.create(:book)
    sleep 0.1
  end

  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインして新規投稿ページへ遷移する
      access_new_post_page(@user)
      # 画像を添付する
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('book[image]', image_path)
      # フォームに情報を入力する
      fill_in 'book[title]', with: @book.title
      select '漫画', from: 'book[category_id]'
      select 'ファンタジー', from: 'book[genre_id]'
      fill_in 'book[catch_copy]', with: @book.catch_copy
      fill_in 'book[content]', with: @book.content
      fill_in 'book[highlight]', with: @book.highlight
      # 「投稿する」ボタンを押すとBookモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Book.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した内容が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image.png']")
      # トップページには先ほど投稿した内容が存在することを確認する（テキスト）
      expect(page).to have_content(@book.title)
    end
  end

  context '新規投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 「投稿する」ボタンを押しても投稿ページではなく、ログインページへ遷移する
      expect(page).to have_content('投稿する')
      click_on('投稿する')
      visit new_user_session_path
    end

    it '謝った情報では投稿情報を保存できずに新規投稿ページへ戻ってくる' do
      # ログインして新規投稿ページへ遷移する
      access_new_post_page(@user)
      # フォームに情報を入力する
      fill_in 'book[title]', with: ''
      select '--', from: 'book[category_id]'
      select '--', from: 'book[genre_id]'
      fill_in 'book[catch_copy]', with: ''
      fill_in 'book[content]', with: ''
      fill_in 'book[highlight]', with: ''
      # 「投稿する」ボタンを押してもBookモデルのカウントが1上がらないことを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Book.count }.by(0)
      # 新規投稿ページへ戻されることを確認する
      expect(current_path).to eq books_path
      # エラーメッセージが表示されることを確認する
      expect(page).to have_css '.field_with_errors'
    end
  end
end

RSpec.describe '投稿編集', type: :system do
  before do
    @book1 = FactoryBot.create(:book)
    @book2 = FactoryBot.create(:book)
    sleep 0.1
  end
  context '投稿編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿した書籍内容の編集ができる' do
      # 書籍1を投稿したユーザーでログインする
      sign_in(@book1.user)
      # 詳細ページへ遷移する
      visit book_path(@book1.id)
      # 書籍1に「編集」ボタンがあることを確認する
      find('#ellipsis-btn').click
      expect(page).to have_link '編集', href: edit_book_path(@book1.id)
      # 編集ページへ遷移する
      click_on('編集')
      visit edit_book_path(@book1.id)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#title').value
      ).to eq(@book1.title)
      expect(
        find('#book-category').value
      ).to eq(@book1.category_id.to_s)
      expect(
        find('#book-genre').value
      ).to eq(@book1.genre_id.to_s)
      expect(
        find('#catch-copy').value
      ).to eq(@book1.catch_copy)
      expect(
        find('#content').value
      ).to eq(@book1.content)
      expect(
        find('#highlight').value
      ).to eq(@book1.highlight)
      # 投稿内容を編集する
      image_path = Rails.root.join('public/images/test_image2.png')
      attach_file('book[image]', image_path)
      fill_in 'book[title]', with: "#{@book1.title}+編集したタイトル"
      select '漫画', from: 'book[category_id]'
      select 'ファンタジー', from: 'book[genre_id]'
      fill_in 'book[catch_copy]', with: "#{@book1.catch_copy}+編集したキャッチコピー"
      fill_in 'book[content]', with: "#{@book1.content}+編集した内容"
      fill_in 'book[highlight]', with: "#{@book1.highlight}+編集した見どころ"
      # 編集してもBookモデルのカウントは変わらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Book.count }.by(0)
      # 編集完了画面（投稿詳細画面）に遷移したことを確認する
      expect(current_path).to eq(book_path(@book1.id))
      # トップページに遷移する
      visit root_path
      # トップページには先ほど変更した内容の書籍が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image2.png']")
      # トップページには先ほど変更した内容の書籍が存在することを確認する（テキスト）
      expect(page).to have_content(@book1.title)
    end
  end
  context '投稿編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した書籍の編集画面には遷移できない' do
      # 書籍1を投稿したユーザーでログインする
      sign_in(@book1.user)
      # 詳細ページへ遷移する
      visit book_path(@book2.id)
      # 書籍1に「編集」ボタンがないことを確認する
      find('#ellipsis-btn').click
      expect(page).to have_no_link '編集', href: edit_book_path(@book2.id)
    end
    it 'ログインしていないと書籍の編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # 書籍1に「編集」ボタンがないことを確認する
      visit book_path(@book1.id)
      # 書籍2に「編集」ボタンがないことを確認する
      visit book_path(@book2.id)
    end
  end
end
