require 'rails_helper'

RSpec.describe "投稿検索", type: :system do
  before do
    @book1 = FactoryBot.create(:book)
    @book2 = FactoryBot.create(:book)
    sleep 0.1
  end

  it 'キーワードを投稿した書籍のタイトルにして検索した場合' do
    # トップページへ遷移して、検索欄があることを確認する
    find_search_form
    # 検索フォームに投稿した書籍のタイトルを入力する
    @keyword = @book1.title
    fill_in 'keyword', with: @keyword
    # 送信ボタンをクリックすると検索結果ページへ遷移することを確認する
    move_to_search_books_path
    # 検索結果ページには「 「@keyword」 の検索結果」という文が表示されていることを確認する
    expect(page).to have_content(@keyword && '「」' && 'の検索結果')
    # 検索結果ページには投稿した内容が表示されていることを確認する（タイトル、画像、投稿者名、投稿時刻）
    expect(page).to have_content(@book1.title && @book1.image && @book1.user.nickname)
    expect(page).to have_selector(".book-posted-time")
  end

  it 'キーワードを空にして検索した場合' do
    # トップページへ遷移して、検索欄があることを確認する
    find_search_form
    # 検索フォームに何も入力しない
    @keyword = ''
    fill_in 'keyword', with: @keyword
    # 送信ボタンをクリックすると検索結果ページへ遷移することを確認する
    move_to_search_books_path
    # 検索結果ページには「 「」の検索結果 」という文が表示されていることを確認する
    expect(page).to have_content('「」' && 'の検索結果')
    # 検索結果ページには全ての投稿が表示されていることを確認する
    expect(page).to have_content( (@book1.title && @book1.image && @book1.user.nickname) &&
                                  (@book2.title && @book2.image && @book2.user.nickname) 
                                )
    expect(page).to have_selector(".book-posted-time")
  end

  it 'キーワードを適当な値にして検索した場合' do
    # トップページへ遷移して、検索欄があることを確認する
    find_search_form
    # 検索フォームに適当な値を入力する
    @keyword = 'あab1い234cうえ56defお78かgきhiく9けこ0j'
    fill_in 'keyword', with: @keyword
    # 送信ボタンをクリックすると検索結果ページへ遷移することを確認する
    move_to_search_books_path
    # 検索結果ページには「 「@keyword」 に該当する投稿は見つかりませんでした」という文が表示されていることを確認する
    expect(page).to have_content(@keyword && '「」' && 'に該当する投稿は見つかりませんでした')
    # 検索結果ページには投稿した書籍が表示されていないことを確認する
    expect(page).to have_no_content( (@book1.title && @book1.image && @book1.user.nickname) &&
                                     (@book2.title && @book2.image && @book2.user.nickname) 
                                    )
    expect(page).to have_no_selector(".book-posted-time")
  end
end