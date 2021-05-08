class UsersController < ApplicationController
  before_action [:authenticate_user!, :set_user, :move_to_root_path]

  def show
    @books = @user.books
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), flash: { update: '更新が完了しました！' }
    else
      render :edit
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