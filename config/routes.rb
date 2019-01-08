Rails.application.routes.draw do
  get '/search', to: 'search#start'
  post '/technologies/:technology_id/tests/:id',
       to: 'tests#start',
       as: 'test_start'
  post '/test/finish', to: 'tests#finish',
                       as: 'test_finish'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :technologies do
    resources :tests
  end
  post '/answer', to: 'answers#answer'
  post '/vote', to: 'votes#vote'
  get '/profile', to: 'users#profile'
  root 'technologies#index'
end
