Rails.application.routes.draw do
  root "programs#index"

  resources :programs, only: [:index, :show]
  devise_for :users
end
