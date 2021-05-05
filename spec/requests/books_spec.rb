require 'rails_helper'
describe BooksController, type: :request do
  before do
    @book = FactoryBot.create(:book)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの書籍のタイトルが存在する' do
      get root_path
      expect(response.body).to include(@book.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの書籍の画像URLが存在する' do
      get root_path
      expect(response.body).to include("book-img")
    end
    it 'indexアクションにリクエストするとレスポンスに「投稿一覧」という文が存在する' do
      get root_path
      expect(response.body).to include('投稿する')
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get book_path(@book)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの書籍のタイトルが存在する' do
      get book_path(@book)
      expect(response.body).to include(@book.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの書籍の画像URLが存在する' do
      get book_path(@book)
      expect(response.body).to include("detail-img")
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do
      get book_path(@book)
      expect(response.body).to include("book-comments")
    end
  end 
end