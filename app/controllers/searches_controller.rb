class SearchesController < ApplicationController
  before_action :authenticate_food_booker!

  def search
    @range = params[:range]

    if @range == "FoodBooker"
      @foodbookers= FoodBooker.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end
