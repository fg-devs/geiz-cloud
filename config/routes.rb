Rails.application.routes.draw do

  # Set default root path to sign in page
  devise_scope :user do
    root to: 'devise/sessions#new'
  end


  # Cloud services
  resources :cloud_services, only: [:index, :show] do
    collection do
      get 'filter'
    end
  end


  # Product comparison
  resources :product_comparisons, only: [:index, :create, :destroy] do
    collection do
      delete 'empty'
    end
  end


  # Devise routes
  devise_for :users, :controllers => { registrations: 'registrations' }


  # Admin namespace
  namespace :admin do
    # User
    resources :users, only: [:index, :edit, :update] do
      collection do
        get   'api'               => 'users#index_api'
        post  'api'               => 'users#create_api'
      end

      member do
        post  'toggle_status'     => 'users#toggle_status'
      end
    end

    # Cloud Services
    resources :cloud_services, except: :destroy do
      collection do
        get   'release'           => 'cloud_services#index_release'
      end

      member do
        post  'toggle_status'     => 'cloud_services#toggle_status'
      end
    end
  end


  # API namespace
  namespace :api do
    resources :cloud_services, only: [:create]
  end


end
