Rails.application.routes.draw do
  get 'tests/show'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :technologies do
    resources :tests
  end
  post '/answer', to: 'tests#answer'
  get '/profile', to: 'users#profile'
  root 'technologies#index'
end
