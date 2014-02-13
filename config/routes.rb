Hamilton::Application.routes.draw do
  root 'listings#index'

  resources :listings

  get ":genre/listings" => 'listings#index', as: 'genre_listing'
end
