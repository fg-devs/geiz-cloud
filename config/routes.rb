Rails.application.routes.draw do

  root 'cloud_services#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  namespace :admin do
    # User
    resources :users, only: [:index, :edit, :update]
    delete 'users/:id'  => 'users#activate_or_deactivate'

    # Cloud Services
    resources :cloud_services, except: :destroy
    delete 'cloud_services/:id'  => 'cloud_services#activate_or_deactivate'
  end

end
