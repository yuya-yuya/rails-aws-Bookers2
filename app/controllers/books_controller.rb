class BooksController < ApplicationController
  before_action :ensure_correct_user, only:[:edit]

  def index
    @books = Book.all
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully"
      redirect_to book_path(@book.id) 
    else
      flash.now[:alert]
      @books = Book.all
      @users = User.all
      @user = current_user
      render :index
    end
  end
  
  def show
    @books = Book.find(params[:id])
    @user = @books.user
    @book = Book.new
  end
  
  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end
  
  def edit
   @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] ="You have updated book successfully."
      redirect_to book_path(@book.id) 
    else
      render "edit"
    end
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def ensure_correct_user
   @book = Book.find(params[:id])
   if @book.user != current_user
    redirect_to books_path
   end
  end
end
