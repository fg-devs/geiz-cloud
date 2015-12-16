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
    resources :users, only: [:index, :edit, :update]
    delete 'users/:id'  => 'users#activate_or_deactivate'

    # Cloud Services
    resources :cloud_services, except: :destroy
    delete 'cloud_services/:id'  => 'cloud_services#activate_or_deactivate'
  end

end
