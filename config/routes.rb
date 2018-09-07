Rails.application.routes.draw do
  devise_for :users
  resources :images, only: [:index, :new, :create, :destroy]
  root 'images#index'

  resources :users do
    resources :favourites
  end

end
