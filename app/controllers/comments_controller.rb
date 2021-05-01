class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to book_path(@comment.book)
    else
      @book = @comment.book
      @comments = @book.comments
      render "books/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to book_path(@comment.book), flash: { delete: "削除が完了しました。" }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end
