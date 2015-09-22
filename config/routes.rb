Rails.application.routes.draw do
  root "programs#index"

  resources :programs, only: [:index, :show, :create, :new, :update, :edit, :destroy]
  devise_for :users
end
