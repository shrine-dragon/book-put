require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @book = FactoryBot.create(:book)
    @comment = FactoryBot.build(:comment)
    sleep 0.1
  end

  context 'コメントを投稿できる時' do
    it 'ログインしているユーザーはコメントを投稿できる' do
      # ログインする
      sign_in(@user)
      # 投稿詳細ページに遷移する
      visit book_path(@book.id)
      # 詳細ページにコメントフォームがあることを確認する
      expect(page).to have_selector '.comment-form'
      # フォームに情報を入力する
      fill_in 'comment[text]', with: @comment.text
      # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Comment.count }.by(1)
      # 詳細ページにリダイレクトされることを確認する
      expect(current_path).to eq book_path(@book.id)
      # 詳細ページに先ほどのコメントの内容、投稿者名、投稿時刻が表示されていることを確認する
      expect(page).to have_content(@comment.text && @comment.created_at)
      expect(page).to have_selector(".comment-posted-user")
    end
  end

  context 'コメントを投稿できない時' do
    it 'ログインしていないユーザーはコメントを投稿できない' do
      # トップページへ遷移する
      visit root_path
      # 投稿詳細ページへ遷移する
      visit book_path(@book.id)
      # 詳細ページにコメントフォームがないことを確認する
      expect(page).to have_no_selector '.comment-form'
    end

    it '文字が入力されていないとコメントを投稿できない' do
      # ログインする
      sign_in(@user)
      # 投稿詳細ページに遷移する
      visit book_path(@book.id)
      # フォームに情報を入力する
      fill_in 'comment[text]', with: ''
      # コメントを送信しても、Commentモデルのカウントが1上がらないことを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Comment.count }.by(0)
      # 詳細ページ上に先ほどのコメント内容が表示されていないことを確認する
      expect(page).to have_no_content(@comment.text)
    end
  end
end

RSpec.describe 'コメント削除', type: :system do
  before do
    @comment1 = FactoryBot.create(:comment)
    @comment2 = FactoryBot.create(:comment)
    sleep 0.1
  end

  context 'コメントの削除ができる時' do
    it 'ログインしているユーザーは自分が投稿したコメントを削除できる' do
      # コメント1を投稿したユーザーでログインする
      sign_in(@comment1.user)
      # コメント1が含まれている書籍の詳細ページへ遷移する
      visit book_path(@comment1.book_id)
      # コメント1に「削除」ボタンがあることを確認する
      find('#ellipsis-btn-2').click
      expect(page).to have_link '削除', href: book_comment_path(@comment1.book_id, @comment1.id)
      # コメントを削除するとレコードの数が1減ることを確認する
      page.accept_confirm do
        find("#destroy-text").click
      end
      change { Comment.count }.by(-1)
      # 詳細ページ上に削除したコメントの内容が存在しないことを確認する
      expect(page).to have_no_content(@comment1.text)
    end

    it 'ログインしているユーザーは自分以外が投稿したコメントを削除できない' do
      # コメント1を投稿したユーザーでログインする
      sign_in(@comment1.user)
      # コメント2が含まれている書籍の詳細ページへ遷移する
      visit book_path(@comment2.book_id)
      # コメント2に「削除」ボタンが無いことを確認する
      find('#ellipsis-btn-2').click
      expect(page).to have_no_link '削除', href: book_comment_path(@comment2.book_id, @comment2.id)
    end

    it 'ログインしていないユーザーはコメントを削除できない' do
      # トップページへ遷移する
      visit root_path
      # コメント1が含まれている書籍の詳細ページへ遷移する
      visit book_path(@comment1.book_id)
      # コメント1に「削除」ボタンが無いことを確認する
      expect(page).to have_no_link '削除', href: book_comment_path(@comment1.book_id, @comment1.id)
      # コメント2が含まれている書籍の詳細ページへ遷移する
      visit book_path(@comment2.book_id)
      # コメント2に「削除」ボタンが無いことを確認する
      expect(page).to have_no_link '削除', href: book_comment_path(@comment2.book_id, @comment2.id)
    end
  end
end