class likesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book
  before_action :redirect_to_root_path

  def create
    @like = Like.create(user_id: current_user.id, book_id: @book.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, book_id: @book.id)
    @likes.destroy
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def redirect_to_root_path
    if @book.user_id == current_user.id
      redirect_to root_path
    end
  end
end