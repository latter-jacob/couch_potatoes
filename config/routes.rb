Rails.application.routes.draw do
  root "programs#index"

  resources :programs, only: [:index, :show, :create, :new, :update, :edit, :destroy] do
    resources :reviews, only: [:create]
  end

  devise_for :users
end
