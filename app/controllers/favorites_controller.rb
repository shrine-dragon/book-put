class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create
    if @book.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, book_id: @book.id)
      redirect_to book_path(@book.id), flash: { add: 'お気に入りに追加しました！' }
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    @favorite.destroy
    redirect_to book_path(@book.id), flash: { delete: 'お気に入りを解除しました。' }
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
