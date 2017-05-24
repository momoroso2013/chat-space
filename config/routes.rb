Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:destroy] do
    resources :messages, only: [:create, :index]
  end
  resources :users do
    collection do
      get :search
    end
  end
end

