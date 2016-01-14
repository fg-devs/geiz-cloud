class RegistrationsController < Devise::RegistrationsController

  # Change scaffold layout to application, only when editing profile
  layout 'application', only: [:edit, :update]


  # Overwrite devise sign up method
  # Adds default role to registered users
  def create
    super do
      resource.add_role :user
    end
  end


  private

  # Overwrite devise method to allow first name and last name on sign up
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # Overwrite devise redirect method after users edit their profile
  def after_update_path_for(resource)
    cloud_services_path
  end

  # Overwrite method to allow first name and last name on editing profile
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end