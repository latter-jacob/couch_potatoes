Rails.application.routes.draw do
  root "programs#index"

  resources :programs, only: [:index, :show] do
      resources :reviews, only: [:create]
  end

  devise_for :users
end
