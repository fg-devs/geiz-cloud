class Api::BaseController < ActionController::Base
  # @api BaseController

  # No layout, plain JSON and XML response only
  layout false

  # Before filters
  before_filter :restrict_access



  private

  # Set ability model
  def current_ability
    @current_ability ||= ApiAbility.new(current_user)
  end


  # Catch AccessDenied exception thrown by CanCanCan
  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception.message }, :status => 401
  end


  # Authenticate user by token
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|

      # Set current user by auth_token (if user exists and active)
      if User.exists?(authentication_token: token)
        @current_user = User.find_by(authentication_token: token)

        # Check if user is active
        @current_user.active ? true : false
      else
        false
      end

    end
  end


  # Get current user
  def current_user
    @current_user
  end

end