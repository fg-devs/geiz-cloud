module Admin::UsersHelper

  # Is user account active
  def user_active?(user)
    user.active
  end


end
