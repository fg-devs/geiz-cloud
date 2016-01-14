class ApiAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :api
      can :create, CloudService
    end

  end
end
