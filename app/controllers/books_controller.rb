class BooksController < ApplicationController
  def index     # 一覧表示
    @books = Book.all
    @book = Book.new
  end

  def edit     # 編集
    @book = Book.find(params[:id])
  end

  def show     # 個別表示
    @book = Book.find(params[:id])
  end

  def create     # 新規登録用のアクション
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def update     # 更新用のアクション
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end

  def destroy     # 削除用のアクション
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # 以下はストロングパラメータです。
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
