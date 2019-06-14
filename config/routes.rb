Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :users, only: [] do
    resources :posts, controller: "users/posts", only: [:index]
  end

  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:show] do
    resources :comments, only: [:create]
  end

end
