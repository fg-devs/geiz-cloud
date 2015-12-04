class IaasAttribute < ActiveRecord::Base

  # Relationships
  belongs_to :cloud_service
  belongs_to :operating_system

  # Validations
  validates :ram, presence: true
  validates :cpu, presence: true
  validates :storage, presence: true
  validates :bandwidth, presence: true

end
