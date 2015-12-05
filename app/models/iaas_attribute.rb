class IaasAttribute < ActiveRecord::Base

  # Relationships
  belongs_to :cloud_service
  belongs_to :operating_system

  # Validations
  validates :ram, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cpu, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :storage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bandwidth, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
