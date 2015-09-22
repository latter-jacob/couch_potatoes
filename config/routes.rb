Rails.application.routes.draw do
  root "programs#index"

  resources :programs, only: [:index, :show, :create, :new, :update, :edit]
  devise_for :users
end
