class User < ActiveRecord::Base

  # Added by rolify gem
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :confirmable

  # Relationships
  has_many :cloud_services

  # Additional validations
  validates :first_name, presence: true, unless: :has_api_role?
  validates :last_name, presence: true, unless: :has_api_role?
  validates :company, presence: true, if: :has_api_role?
  validates_with TechnikumEmailValidator, unless: :has_api_role?

  # Before create
  before_create :generate_auth_token


  # Override devise method
  # Password is not required if user will be an API user
  # API users authenticate with generated token
  def password_required?
    super && !self.has_role?(:api)
  end


  # Check if user has "api" role
  def has_api_role?
    self.has_role?(:api)
  end


  # Adds a default role to the user
  def add_default_role
    self.add_role :user
  end

  # Generate authentication token for REST API
  def generate_auth_token
    if has_api_role?
      self.authentication_token = loop do
        token = Devise.friendly_token(128)
        break token unless self.class.exists?(authentication_token: token)
      end
    end
  end


  # Overrides Devise method: Check if user is allowed for login
  def active_for_authentication?
    super && active
  end



  ##### SCOPES for querying ######

  # By role
  scope :by_role, ->(roles) {
    if roles.blank?
      all
    else
      includes(:roles).where(roles: { name: roles })
    end
  }

end
