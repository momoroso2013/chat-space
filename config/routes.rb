Rails.application.routes.draw do
  devise_for :users
 root 'groups#index'
 resources :groups, except: [:create, :destroy] do
   resources :messages, only: [:create, :index]
 end
end
