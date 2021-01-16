class UsersController < ApplicationController
  def show
    @books = Book.all
  end
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  def edit
  end
end
