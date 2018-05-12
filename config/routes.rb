Rails.application.routes.draw do
  root to: 'posts#index'

  resources :category do
    resources :posts
    resources :comments
  end

  resources :posts do
    resources :comments
  end
end
