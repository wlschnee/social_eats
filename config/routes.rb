Rails.application.routes.draw do
  root "home#index"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/events/:id/join" => "events#join", as: :join
  post "/search" => "search#new"
  post "/search/users" => "search#users"
  get "/contact" => "users#contact", as: :contact
  resources :locations do
    member do
      post 'like'
    end
  end
  resources :events
  resources :locations
  resources :events do
    get :autocomplete_location_name, on: :collection
  end
  resources :users
  resources :registrations
  resources :friendships
  resources :comments
  resources :tips
  get '/auth/:provider/callback', to: "sessions#create"
  mount ActionCable.server => '/cable'
end
