require 'rails_helper'

RSpec.describe "投稿検索", type: :system do
  before do
    @book1 = FactoryBot.create(:book)
    @book2 = FactoryBot.create(:book)
    sleep 0.1
  end

  it 'キーワードを投稿した書籍のタイトルにして検索した場合' do
    find_search_form
    # 検索フォームに投稿した書籍のタイトルを入力する
    fill_in 'keyword', with: @book1.title
    # 送信ボタンをクリックすると検索結果ページへ遷移したことを確認する
    move_to_search_books_path
    # 検索結果ページには投稿した書籍が表示されていることを確認する
    expect(page).to have_content(@book1.title && @book1.image && @book1.user.nickname)
  end

  it 'キーワードを空にして検索した場合' do
    find_search_form
    # 検索フォームに何も入力しない
    fill_in 'keyword', with: ''
    # 送信ボタンをクリックすると検索結果ページへ遷移したことを確認する
    move_to_search_books_path
    # 検索結果ページには全ての投稿が表示されていることを確認する
    expect(page).to have_content(@book1.title && @book1.image && @book1.user.nickname &&
                                 @book2.title && @book2.image && @book2.user.nickname)
  end

  it 'キーワードを適当な値にして検索した場合' do
    find_search_form
    # 検索フォームに適当な値を入力する
    fill_in 'keyword', with: 'あab1い234cうえ56defお78かgきhiく9けこ0j'
    # 送信ボタンをクリックすると検索結果ページへ遷移したことを確認する
    move_to_search_books_path
    # 検索結果ページには投稿した書籍が表示されていないことを確認する
    expect(page).to have_no_content( (@book1.title && @book1.image && @book1.user.nickname) ||
                                     (@book2.title && @book2.image && @book2.user.nickname) )
    # 検索結果ページには「該当する投稿は見つかりませんでした」という文が表示されていることを確認する
    expect(page).to have_content('該当する投稿は見つかりませんでした')
  end
end