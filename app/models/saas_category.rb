class SaasCategory < ActiveRecord::Base

  # Relationships
  has_and_belongs_to_many :cloud_services

end
