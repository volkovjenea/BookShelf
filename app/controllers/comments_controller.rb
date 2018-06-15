class CommentsController < ApplicationController

  def create
    @author = Author.find(params[:author_id])
    @comment = @author.comments.create(params[:comment].permit(:text, :name))
    redirect_to author_path(@author)

    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(params[:comment].permit(:text, :name))
    redirect_to book_path(@book)
  end

  def destroy
    @author = Author.find(params[:author_id])
    @comment = @author.comments.find(params[:id])
    @comment.destroy
    redirect_to author_path(@author)

		@book = Book.find(params[:book_id])
		@comment = @book.comments.find(params[:id])
		@comment.destroy
		redirect_to book_path(@book)
  end
end
