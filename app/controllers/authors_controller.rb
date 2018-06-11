#
# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :find_author, only: %i[show edit update destroy] 

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
  
  def find_author
    @author = Author.find(params[:id])
  end
 
  def author_params
    params.require(:author).permit(:name, :bio)
  end
end
