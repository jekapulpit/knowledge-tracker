Rails.application.routes.draw do
  get 'answers/answer'
  get 'tests/show'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :technologies do
    resources :tests
  end
  post '/answer', to: 'answers#answer'
  get '/profile', to: 'users#profile'
  root 'technologies#index'
end
