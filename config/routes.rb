Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :animals, only: [ :index, :show, :new, :create, :destroy ] do
    resources :locations, only: [ :new, :create ] do
      resources :reviews, only: [ :new, :create ]
    end
  end

  resources :locations, only: [ :show ]

end
