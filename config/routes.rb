Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants
  get "restaurants/statics", to: "restaurants#statistics"
end
