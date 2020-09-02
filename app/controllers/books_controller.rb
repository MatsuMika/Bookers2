class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
   @book = Book.find(params[:id])
   @user = @book.user
   @book_new = Book.new
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id

   if @book.save
    flash[:notice] = 'You have creatad book successfully.'
    redirect_to book_path(@book.id)
   else
    @books = Book.all
    @user = current_user
    render :index
   end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:successfully] = "You have updated book successfully"
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end
end
