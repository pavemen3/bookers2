class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def show
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def edit
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
