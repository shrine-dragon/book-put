class FavoritesController < ApplicationController
  before_action :set_book,

  def create
    if @book.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, book_id: @book.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
