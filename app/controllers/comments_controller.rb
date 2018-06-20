#
# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_up_commentable
  
  def create
    @comment = @commentable.comments.create(comment_params)
    if @commentable.is_a? Book
      redirect_to book_path(@commentable)
    else
      redirect_to author_path(@commentable)
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    if @commentable.is_a? Book
      redirect_to book_path(@commentable)
    else
      redirect_to author_path(@commentable)
    end
  end

  def get_book
    @book = Book.find(params[:book_id])
  end

  def get_author
    @author = Author.find(params[:author_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :text)
  end

  def set_up_commentable
    if params[:book_id]
      @commentable = get_book
    else
      @commentable = get_author
    end
  end
end
