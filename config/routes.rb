Rails.application.routes.draw do
  root 'boardgames#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boardgames do
    resources :reviews, only: [:index, :new, :create, :destroy]
  end
end
