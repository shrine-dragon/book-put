class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book,

  def create
    @favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    @favorite.save
    redirect_to root_path
  end

  def destroy
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    redirect_to root_path
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == @book.user_id
  end
end
