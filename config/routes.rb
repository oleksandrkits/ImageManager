Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {sign_in:'login',
                          sign_out:'logout',
                          sign_up:'register'},
             controllers: { registrations: "users/registrations"}

  resources :images, only: [:index, :new, :create, :destroy]
  root 'images#index'

  resources :users do
    resources :favourites
  end

end
