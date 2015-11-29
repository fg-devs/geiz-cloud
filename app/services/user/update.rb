class Services::User::Update

  def self.build
    new
  end

  # Updates a single user
  # @param [Object] id
  # @param [Object] user_attributes
  def call(id, user_attributes)
    user = User.find(id)

    begin
      user.update_attributes!(user_attributes)
    rescue
      [false, user]
    else
      [true, user]
    end
  end

end
