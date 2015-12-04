class UserService::ChangeStatus

  def self.build
    new
  end

  # Updates the status (active/inactive) of a user
  # @param [Object] id
  def call(id)
    user = User.find(id)

    begin
      if user.active
        user.update_attributes!({active: false})
      else
        user.update_attributes!({active: true})
      end
    rescue
      [false, user]
    else
      [true, user]
    end
  end

end
