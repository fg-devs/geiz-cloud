class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  # Redirect if not authorized (CanCanCan)
  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      redirect_to new_user_session_url, :alert => I18n.t('devise.failure.unauthenticated')
    else
      redirect_to cloud_services_url, :alert => exception.message
    end
  end

  # Overwriting the sign_in redirect path method from devise gem
  def after_sign_in_path_for(resource_or_scope)
    cloud_services_path
  end

  # Overwriting the sign_out redirect path method from devise chem
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end
