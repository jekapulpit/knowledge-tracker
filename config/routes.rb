Rails.application.routes.draw do
  delete 'technologies_users/destroy/:id',
         to: 'technologies_users#destroy',
         as: 'destroy_users_technology'
  get '/search', to: 'search#start'
  post '/technologies/:technology_id/tests/:id',
       to: 'tests#start',
       as: 'test_start'
  post '/profile/change_avatar', to: 'users#change_avatar', as: 'change_avatar'
  post '/test/finish', to: 'tests#finish',
                       as: 'test_finish'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :technologies do
    resources :tests
  end
  post '/answer', to: 'answers#answer'
  post '/vote', to: 'votes#vote'
  delete '/vote/:id', to: 'votes#destroy', as: 'delete_mark'
  get '/profile', to: 'users#profile'
  root 'technologies#index'
end
