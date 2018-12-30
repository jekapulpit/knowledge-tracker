Rails.application.routes.draw do
  get 'search/start'
  get 'answers/answer'
  post '/technologies/:technology_id/tests/:id',
       to: 'tests#start',
       as: 'test_start'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :technologies do
    resources :tests
  end
  post '/answer', to: 'answers#answer'
  get '/profile', to: 'users#profile'
  root 'technologies#index'
end
