Atlas::Application.routes.draw do
  resources :users do 
    resources :common_apps, only: [:new, :create] 
    resources :videos, only: [:new, :create] 
  end

  resources :common_apps, except: [:new, :create, :index]
  resources :common_apps, except: [:new, :create, :index]

  resources :jobs do 
    resources :applications, only: [:new, :create]
  end

  resources :applications, except: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  namespace :admin do 
    resources :users, only: :show
    resources :jobs,  only: :show
    get '', to: 'users#index', as: '/'
  end

  root  "jobs#index"

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/blurb',  to: 'jobs#blurb',            via: 'get'
end
