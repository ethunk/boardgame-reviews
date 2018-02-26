Rails.application.routes.draw do
  root 'boardgames#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :boardgames, only: [:index, :show, :destroy]
  end

  resources :boardgames do
    resources :reviews, only: [:new, :show, :edit, :create, :destroy, :update]
  end

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end



end
