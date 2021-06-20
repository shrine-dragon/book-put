class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user 
  before_action :move_to_root_path

  def show
    @books = @user.books
    @questionnaire = Questionnaire.find_by(params[:user_id])
    favorites = Favorite.where(user_id: current_user.id).order(created_at: :desc).pluck(:book_id)
    @favorites = Book.find(favorites)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path, flash: { delete: "ご利用ありがとうございました。" }
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :gender_id, :birth_day, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_root_path
    redirect_to root_path if current_user.id != @user.id
  end
end