class BookCommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    comment = book.book_comments.new(book_comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to book_path(book)  
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    if book_comment.user != current_user
      redirect_to books_path
    end
    book_comment.destroy
    redirect_to books_path
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end



