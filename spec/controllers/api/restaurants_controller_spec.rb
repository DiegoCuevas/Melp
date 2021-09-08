require 'rails_helper'

RSpec.describe Api::RestaurantsController, type: :controller do
  def valid_attributes
    { name:"test restaurant", rating: 2, email: "test@mail.com" }
  end
  def valid_session
    {}
  end

  describe "GET index" do
    it "index response ok" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
  describe "GET show" do
    it "assigns the requested restaurant as @restaurant" do
      restaurant = Restaurant.create! valid_attributes
      get :show, params: {id: restaurant.to_param}
      expect(response).to have_http_status(:ok)
    end
  end
  describe "POST #create" do
    context "with valid params" do
      it "creates a new restaurant" do
        expect {
          post :create, params: {restaurant: valid_attributes}
        }.to change(Restaurant, :count).by(1)
      end
    end
  end
   describe "PUT #update" do
    context "with valid params" do
      it "redirects to the restaurant" do
        restaurant = Restaurant.create! valid_attributes
        put :update, params: {id: restaurant.to_param, restaurant: valid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end
   
  end

  describe "DELETE #destroy" do
    it "destroys the requested restaurant" do
      restaurant = Restaurant.create! valid_attributes
      expect {
        delete :destroy, params: {id: restaurant.to_param}
      }.to change(Restaurant, :count).by(-1)
    end

   
  end

end
