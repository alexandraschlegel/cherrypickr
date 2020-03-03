Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]

  resources :products, only: [:index, :show] do
    resources :user_products, only: [:create, :new]

  end
end
