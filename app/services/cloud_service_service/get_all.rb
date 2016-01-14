class CloudServiceService::GetAll

  def self.build
    new
  end

  # Get all Cloud Services
  def call(created_by_roles = nil, active = nil)
    cloud_services = CloudService.includes(:cloud_service_type)

    cloud_services = cloud_services.created_by_role(created_by_roles)
    cloud_services = cloud_services.by_status(active)

    cloud_services
  end

end