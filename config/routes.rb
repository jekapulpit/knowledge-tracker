Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :technologies
  get '/profile', to: 'users#profile'
  root 'technologies#index'
end
