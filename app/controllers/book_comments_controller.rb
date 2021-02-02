class BookCommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_commmentid])
    comment = current_user.post_comments.new(book_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)  end

  def destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end
