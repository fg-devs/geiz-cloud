class OperatingSystem < ActiveRecord::Base

  # Relationships
  has_many :iaas_attributes

end
