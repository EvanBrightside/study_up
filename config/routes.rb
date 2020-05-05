Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :courses, only: [:index, :show]
  resources :students

  root 'courses#index'
end
