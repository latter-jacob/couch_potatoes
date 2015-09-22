Rails.application.routes.draw do
  devise_for :admins
  root "programs#index"

  resources :programs, only: [:index, :show, :create, :new, :update, :edit]
  devise_for :users
end
