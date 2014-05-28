Atlas::Application.routes.draw do
  resources :users, only: [:new, :show, :create] do 
    get 'share/:admin_link', to: 'users#share', on: :collection
  end

  resources :jobs, only: [:index, :show] do 
    get 'blurb', to: 'jobs#blurb', on: :collection
    resources :applications, only: [:create]
  end
  
  resources :secret_keys, only: [:show, :create]
  
  resources :applications, except: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, except: [:show, :index]
  
  namespace :admin do 
    get '', to: 'jobs#index', as: '/'
    resources :jobs

    resources :users do 
      get 'reset_token', to: 'users#reset_token', on: :member
    end

    resources :applications, only: [:create, :update]
  end
  
  namespace :api do
    resources :common_apps, only: [:show, :update]
    resources :videos, only: [:create, :update] 

    resources :users, only: [:show, :update] do
        get 'potentials', to: 'users#potentials', on: :member
    end

    namespace :admin do 
      resources :users, only: [:show, :update] do
          get 'potentials', to: 'users#potentials', on: :member
      end

      resources :applications, only: :update

      resources :jobs, only: :show do
        get 'potentials', to: 'jobs#potentials', on: :member 
      end
    end
  end

  root  "jobs#index"
  match 'mainsignup',             to: 'users#iframe_signup',      via: 'get'
  match '/signup',                to: 'users#new',                via: 'get'
  match '/signin',                to: 'sessions#new',             via: 'get'
  match '/signout',               to: 'sessions#destroy',         via: 'delete'
  match '/blurb',                 to: 'jobs#blurb',               via: 'get'
  match '/refer',                 to: 'jobs#refer',               via: 'post'
  match '/companies/get_started', to: 'users#company_start',      via: 'get'
  match '/companies/send_start',  to: 'users#company_send_start', via: 'post'
  match '/companies/new_job',     to: 'secret_keys#new_job',      via: 'get'
  match '/companies/create_job',  to: 'secret_keys#create_job',   via: 'post'
end