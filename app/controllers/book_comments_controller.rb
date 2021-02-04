class BookCommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    comment = book.book_comments.new(book_comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to book_path(book)  
  end

  def destroy
    PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end

