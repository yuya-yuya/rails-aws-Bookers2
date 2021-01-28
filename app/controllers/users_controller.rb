class UsersController < ApplicationController
  def show
    @user = current_user
    @users = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    @books1 = @users.books
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
    if @user.update(user_params)
      redirect_to user_path(@user.id) ,notice: "You have been updated successfully"
    else
      render :edit
    end
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(current_user)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

