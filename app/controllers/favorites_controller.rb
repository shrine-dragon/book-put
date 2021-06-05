class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book,
  before_action :move_to_root_path

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

  def move_to_root_path
    redirect_to root_path if current_user.id == @book.user_id
  end
end
