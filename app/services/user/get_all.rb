class Services::User::GetAll

  def self.build
    new
  end

  # Get all registered users
  def call
    User.all
  end

end