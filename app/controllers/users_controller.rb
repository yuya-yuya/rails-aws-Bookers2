class UsersController < ApplicationController
  def show
    @books = Book.all
    @user = current_user
  end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(@user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
