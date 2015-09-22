Rails.application.routes.draw do
  devise_for :admins
  root "programs#index"

  resources :programs, only: [:index, :show, :create, :new, :update, :edit] do
    resources :reviews, only: [:create]
  end

  devise_for :users
end
