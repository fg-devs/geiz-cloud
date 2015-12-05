class CloudServiceService::GetSingle

  def self.build
    new
  end

  # Get a single Cloud Service
  # @param [Object] id
  def call(id)
    cloud_service = CloudService.find(id)

    # Check what Cloud Service Type/Model the given Cloud Service is, to join necessary attributes
    if cloud_service.cloud_service_type_id.to_i == CloudServiceType::IAAS_ID
      CloudService.includes(:iaas_attribute).find(id)
    elsif cloud_service.cloud_service_type_id == CloudServiceType::PAAS_ID
      CloudService.includes(:paas_categories).find(id)
    elsif cloud_service.cloud_service_type_id == CloudServiceType::SAAS_ID
      CloudService.includes(:saas_categories).find(id)
    end
  end

end
