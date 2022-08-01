class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Saved!'
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit; end

  def update
    if @book.update(book_params)
      flash[:notice] = 'Updated!'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = 'Book deleted!'
    redirect_to books_path, status: 303
  end

  private

  def book_params
    params.require(:book).permit(:name, :author)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
