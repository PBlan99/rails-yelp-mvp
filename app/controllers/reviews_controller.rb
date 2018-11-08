class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params) # should replace with .new(restaurant_params) to use the sanitised params, instead of the dirty one
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant # here we are specifying the restaurant_id, this is equivalent to writing @review.restaurant_id = @restaurant.id
    return redirect_to restaurant_path(@restaurant) if @review.save
    render :new
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating) # this is called strong params, for security
  end

end
