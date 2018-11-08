class RestaurantsController < ApplicationController

  def index
    @all_restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @all_reviews_for_a_res = @restaurant.reviews
    # @review = Review.where(restaurant_id: @restaurant.id) # You can access the Review class thanks to ApplicationController inheritance, this is related to ActiveRecord (not exclusively Rails), we can access classes anywhere.
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params) # should replace with .new(restaurant_params) to use the sanitised params, instead of the dirty one
    return redirect_to restaurants_path if @restaurant.save
    render :new
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category) # this is called strong params, for security
  end

end
