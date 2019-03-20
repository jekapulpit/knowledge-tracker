Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
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
    resources :tests do
      resources :questions, only: %i[new create update destroy] do
        resources :answers, only: %i[create update destroy]
      end
    end
  end
  namespace :api do
    resources :technologies, only: [:index] do
      resources :tests
    end
    resources :tests, only: [:update]
  end
  post '/answer', to: 'answers#answer'
  get '/profile', to: 'users#profile'
  root 'technologies#index'
end
