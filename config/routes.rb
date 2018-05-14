Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api do
    resources :categories do
      resources :posts
      resources :comments
    end

    resources :posts do
      resources :comments
    end
  end

  get '/*path', to: 'home#index', format: false
end
