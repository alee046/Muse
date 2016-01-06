Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get 'users/new'
  get 'users/create'
  get '/like/:id', to: 'posts#like', as: :like
  get 'login' => 'sessions#new'
  get 'feed' => 'posts#index'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :posts, only: [:create, :destroy]
end
