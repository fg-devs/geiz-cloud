class CloudServiceType < ActiveRecord::Base

  # IDs from database table "cloud_service_types", they do and should not change
  IAAS_ID = 1
  PAAS_ID = 2
  SAAS_ID = 3

  # Relationships
  has_many :cloud_services

end
