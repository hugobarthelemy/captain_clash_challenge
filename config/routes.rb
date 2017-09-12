Rails.application.routes.draw do
  root to: 'pages#home'
  resources :persos, only: [:new, :create, :index, :destroy]
  resources :fights, only: [:new, :create, :show]
end
