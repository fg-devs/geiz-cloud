class CloudService < ActiveRecord::Base

  # IDs from database table "cloud_service_types", they do and should not change
  IAAS_ID = 1
  PAAS_ID = 2
  SAAS_ID = 3

  # Relationships
  belongs_to :cloud_service_type
  belongs_to :user

  # Only if type is Iaas
  has_one :iaas_attribute
  accepts_nested_attributes_for :iaas_attribute

  # Only if type is PaaS
  has_and_belongs_to_many :paas_categories

  # Only if type is SaaS
  has_and_belongs_to_many :saas_categories

  # Validations
  validates :title, presence: true, length: { maximum: 100 }
  validates :short_description, presence: true, length: { maximum: 255 }
  validates :long_description, presence: true
  validates :price, presence: true
  validates :provider_url, presence: true, length: { maximum: 255 }

  # IaaS must not be validated. It is a different kind of association and has its own validations
  validates :paas_categories, presence: true, if: :should_validate_paas?
  validates :saas_categories, presence: true, if: :should_validate_saas?


  # Should PaaS be validated?
  def should_validate_paas?
    cloud_service_type_id == PAAS_ID
  end

  # Should SaaS be validated?
  def should_validate_saas?
    cloud_service_type_id == SAAS_ID
  end

end
