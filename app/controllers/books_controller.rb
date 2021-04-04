class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :book_category_id, :book_genre_id, :catch_copy, :content, :highlight).merge(user_id: current_user.id)
  end
end
