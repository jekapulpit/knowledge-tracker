Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks' }
  get 'users/profile', as: 'user_root'

  root 'users#profile'
end
