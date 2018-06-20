#
# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit update destroy]
  before_action :all_authors, only: %i[new edit]

  def index
    @books = Book.page(params[:page])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def all_authors
    @authors = Author.all
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params
    .require(:book)
    .permit(
      :title,
      :description,
      :isbn,
      :image,
      author_ids: []
    )
  end
end
