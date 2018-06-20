#
# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :find_author, only: %i[show edit update destroy]
  before_action :all_books, only: %i[new edit]

  def index
    @authors = Author.page(params[:page])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def all_books
    @books = Book.all
  end
  
  def find_author
    @author = Author.find(params[:id])
  end
 
  def author_params
    params.require(:author).permit(:name, :bio, :image, :book_ids => [])
  end
end
