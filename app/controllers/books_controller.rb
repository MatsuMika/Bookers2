class BooksController < ApplicationController

  def top
  end

  def about
  end

  def new
  	@book = Book.new
  end

  def index
  	@books = Book.all
  end

  def show
   @book = Book.find(params[:id])
  end

  def create
   @book = Book.new(book_params)

   if @book.save
    flash[:notice] = 'Book was successfully cyeated'
    redirect_to book_path(@book.id)
   else
    @books = Book.all
    render :index
   end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:successfully] = "Book was successfully updated"
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end
end
