class UserService::GetSingle

  def self.build
    new
  end

  # Get a single registered users
  # @param [Object] id
  def call(id)
    User.find(id)
  end

end
