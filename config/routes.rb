Atlas::Application.routes.draw do
  resources :users do 
    resource :common_app, only: [:index, :new, :create] 
    resources :videos, only: [:index, :new, :create] 
  end

  resources :common_apps, except: [:new, :create, :index]
  resources :common_apps, except: [:new, :create, :index]

  resources :jobs, only: [:index, :show] do 
    resources :applications, only: [:create]
  end

  resources :applications, except: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, except: [:show, :index]
  
  namespace :admin do 
    get '', to: 'users#index', as: '/'
    resources :users, only: :show
    resources :jobs,  except: :show
  end

  root  "jobs#index"

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/blurb',   to: 'jobs#blurb',           via: 'get'
end
