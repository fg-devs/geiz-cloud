class UserService::Create

  def self.build
    new
  end

  # Creates a new user
  # @param [Object] id
  # @param [Object] user_attributes
  def call(user_attributes, role)
    user = User.new(user_attributes)
    user.add_role role
    user.skip_confirmation!

    begin
      user.save!
    rescue
      [false, user]
    else
      [true, user]
    end
  end

end
