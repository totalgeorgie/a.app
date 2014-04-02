Atlas::Application.routes.draw do
  resources :users do 
    get 'potentials', to: 'users#potentials', on: :member
  end
  
  resources :videos, only: [:create, :update]
  resources :common_apps, only: [:update, :show]

  resources :jobs, only: [:index, :show] do 
    resources :applications, only: [:create]
  end

  resources :applications, except: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, except: [:show, :index]
  
  namespace :admin do 
    get '', to: 'jobs#index', as: '/'
    resources :users
    
    resources :jobs do
      get 'potentials', to: 'jobs#potentials', on: :member
    end
    
    resources :applications, only: :update
  end

  root  "jobs#index"
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/blurb',   to: 'jobs#blurb',           via: 'get'
end