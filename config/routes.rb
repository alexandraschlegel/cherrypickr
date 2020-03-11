Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/about', to: 'pages#about'
  get 'pages/faq', to: 'pages#faq'


  resources :users
  resources :supermarkets, only: [:show]

  resources :products, only: [:index, :show] do
    resources :user_products, only: [:create, :new]


  end
  resources :user_products
end
