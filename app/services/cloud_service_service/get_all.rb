class CloudServiceService::GetAll

  def self.build
    new
  end

  # Get all Cloud Services
  def call
    CloudService.joins(:cloud_service_type)
  end

end