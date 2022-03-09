class RelationshipsController < ApplicationController

  def create
    current_food_booker.follow(params[:food_booker_id])
    redirect_to request.referer
  end

  def destroy
    current_food_booker.unfollow(params[:food_booker_id])
    redirect_to request.referer
  end

  def followings
    food_booker = FoodBooker.find(params[:food_booker_id])
    @food_bookers = food_booker.followings
  end

  def followers
    food_booker = FoodBooker.find(params[:food_booker_id])
    @food_bookers = food_booker.followers
  end
end
