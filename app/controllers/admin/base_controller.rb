class Admin::BaseController < ApplicationController


  private

  # Set ability model
  def current_ability
    @current_ability ||= AdminAbility.new(current_user)
  end

end

