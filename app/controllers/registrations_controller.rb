class RegistrationsController < Devise::RegistrationsController

  # Change scaffold layout to application, only when editing profile
  layout 'application', only: [:edit, :update]

  private

  # Overwrite method to allow first name and last name on sign up
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # Overwrite redirect method after users edit their profile
  def after_update_path_for(resource)
    cloud_services_path
  end

  # Overwrite method to allow first name and last name on editing profile
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end