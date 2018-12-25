Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :technologies do
    resources :tests
  end
  get '/profile', to: 'users#profile'
  root 'technologies#index'
end
