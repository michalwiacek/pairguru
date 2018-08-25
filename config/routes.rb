Rails.application.routes.draw do
  devise_for :users

  get '/top_commenters', to: 'home#top_commenters'

  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :show]
      resources :genres, only: [:index, :show]
    end
  end
end
