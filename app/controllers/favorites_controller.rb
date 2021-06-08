class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create
    @favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    if @book.user_id != current_user.id
      @favorite.save
      redirect_to book_path(@book.id), flash: { add: 'お気に入りに追加しました！' }
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    if @book.user_id != current_user.id
      @favorite.destroy
      redirect_to book_path(@book.id), flash: { delete: 'お気に入りを解除しました。' }
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
