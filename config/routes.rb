Rails.application.routes.draw do
  root "programs#index"

  resources :programs, only: [:index, :show, :create, :new, :update, :edit] do
    resources :reviews, only: [:create]
  end

  resources :reviews, only: [:index] do
    resources :votes, only: [:create, :update, :destroy]
  end

  devise_for :users
end
