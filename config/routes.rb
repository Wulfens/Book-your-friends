Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :dashboard, only: [ :show ]
  resources :animals, only: [ :index, :show, :new, :create, :destroy ] do
    resources :locations, only: [ :new, :create ]
  end

  resources :locations, only: [ :show ] do
    resources :reviews, only: [ :new, :create ]
  end

  resources :locations do
    member do
      patch "/accept", to: "locations#accept"
      patch "/decline", to: "locations#decline"
    end
  end
end
