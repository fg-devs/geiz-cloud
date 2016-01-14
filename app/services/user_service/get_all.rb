class UserService::GetAll

  def self.build
    new
  end

  # Get all registered users
  # @param [Array] roles
  def call(roles = nil)
    users = User.all

    # Filter by role (optionally)
    users = users.by_role(roles)

    users
  end

end