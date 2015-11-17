class RegistrationsController < Devise::RegistrationsController

  private

  # Overwrite method to allow first name and last name on sign up
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # Overwrite method to allow first name and last name on editing profile
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end