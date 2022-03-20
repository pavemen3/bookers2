class BooksController < ApplicationController
  def new
    @new_book = Book.new
  end

  def create
    @user = User.find(current_user.id)
    @new_book = Book.new(book_params)
    @new_book.user_id = @user.id
    if @new_book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@new_book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @user = User.find(current_user.id)
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @new_book = Book.new
  end

  def edit
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :book_image)
  end
end
