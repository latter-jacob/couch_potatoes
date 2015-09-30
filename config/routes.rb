Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root "programs#index"

  resources :programs, only: [:index, :show, :create, :new, :update, :edit, :destroy] do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  resources :reviews, only: [:index, :show] do
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :votes, only: [:index]

  devise_for :users
end
