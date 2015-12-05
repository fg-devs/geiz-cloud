class CloudServiceTypeService::GetAll

  def self.build
    new
  end

  # Get all cloud service types
  def call
    CloudServiceType.all
  end

end