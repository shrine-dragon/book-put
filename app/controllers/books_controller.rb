class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book,             only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path,    only: [:edit, :update, :destroy]

  def index
    @books = Book.includes(:user).order('created_at DESC').page(params[:page]).per(3)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, flash: { post: '投稿に成功しました！' }
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @all_comments = @book.comments.includes(:user)
    @comments = @all_comments.order('created_at DESC').page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id), flash: { update: '更新が完了しました！' }
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to root_path, flash: { delete: "削除が完了しました。" }
    end
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :category_id, :genre_id, :catch_copy, :content,
                                 :highlight).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def move_to_root_path
    redirect_to root_path if current_user.id != @book.user_id
  end
end
