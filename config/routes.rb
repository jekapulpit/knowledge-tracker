Rails.application.routes.draw do

  devise_for :users
  get 'users/profile', as: 'user_root'


  root 'home#index'
end
