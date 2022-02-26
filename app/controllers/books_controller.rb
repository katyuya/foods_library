class BooksController < ApplicationController
  before_action :authenticate_food_booker!
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.food_booker_id = current_food_booker.id
    if @book.save
      flash[:notice] = "投稿しました！"
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @food_booker = current_food_booker
    if params[:tag_list_ids]
      @books = []
      params[:tag_list_ids].each do |key, value|
        @books += TagList.find_by(name: key).books if value == "1"
      end
      @books.uniq!
    end
  end

  def show
    @book = Book.find(params[:id])
    @food_booker = @book.food_booker
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.food_booker == current_food_booker
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "投稿内容を変更しました"
      redirect_to book_path(@book.id)
    else
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
    params.require(:book).permit(:image, :food_name, :food_introduction, :restaurant, :material, :cooking, tag_list_ids: [])
  end
end
