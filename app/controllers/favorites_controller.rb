class FavoritesController < ApplicationController
  before_action :book_params
  def create
    Favorite.create(food_booker_id: current_food_booker.id, book_id: params[:id])
  end

  def destroy
    Favorite.find_by(food_booker_id: current_food_booker.id, book_id: params[:id]).destroy
  end

  private

  def book_params
    @book = Book.find(params[:id])
  end
end
