class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def show
    render json: @restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: @restaurant, status: :created
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @bank_bink.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
  end
  
  # /restaurants/statistics?latitude=x&longitude=y&radius=z
  def statistics
    if params[:longitude].present? && params[:latitude].present? && params[:radius].present?
      @statistics = Restaurant.search(params[:longitude], params[:latitude], params[:radius])
      render json: @statistics
    else
      render json: {message: "You need send the following parameters: 'longitude', 'latitude', 'radius'"} , status: :unprocessable_entity
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :rating, :site, :email, :phone, :street, :city, :state, :lat, :lng)
    end
end