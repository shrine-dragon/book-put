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
      expect(response.body).to include('投稿一覧')
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get book_path(@book)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスに投稿済みの書籍の画像URLが存在する' do
      get book_path(@book)
      expect(response.body).to include("detail-img")
    end

    it 'showアクションにリクエストするとレスポンスに投稿済みの書籍の内容（画像以外）が表示されている' do
      get book_path(@book)
      expect(response.body).to include(@book.title && @book.user.nickname && @book.created_at && @book.category.name && @book.genre.name && @book.catch_copy && @book.content && @book.highlight)
    end
    
    it 'showアクションにリクエストするとレスポンスにコメント部分が存在する' do
      get book_path(@book)
      expect(response.body).to include("book-comments")
    end
  end 
end