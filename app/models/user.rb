class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  # Relationships
  has_many :cloud_services

  # Additional validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_with TechnikumEmailValidator

  # Overrides Devise method: Check if user is allowed for login
  def active_for_authentication?
    super && active
  end

end
