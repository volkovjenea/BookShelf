#
# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_up_commentable
=begin
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

  def book
    @book = Book.find(params[:book_id])
  end

  def author
    @author = Author.find(params[:author_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :text)
  end

  def set_up_commentable
    if params[:book_id]
      @commentable = book
    else
      @commentable = author
    end
  end
=end
end
