class UsersController < ApplicationController
  def show
    @books = Book.all
  end
  def index
    @users = User.all
  end
  def edit
  end
end
