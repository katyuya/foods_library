class FoodBookersController < ApplicationController
  before_action :authenticate_food_booker!
  def show
    @food_booker = FoodBooker.find(params[:id])
    @books = @food_booker.books
  end

  def edit
    @food_booker = FoodBooker.find(params[:id])
    if @food_booker == current_food_booker
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @food_booker = FoodBooker.find(params[:id])
    if @food_booker.update(food_booker_params)
      flash[:notice] = "プロフィールを変更しました"
      redirect_to food_booker_path(@food_booker.id)
    else
      render :edit
    end
  end

  private

  def food_booker_params
    params.require(:food_booker).permit(:profile_image, :name, :introduction)
  end
end
