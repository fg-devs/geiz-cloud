class CloudServiceService::GetFiltered

  def self.build
    new
  end

  # Get all Cloud Services filtered
  def call(cs_filter_attributes)


    # TODO: Scoping

    cloud_services = CloudService.where(nil)

    # Check cloud service type
    cloud_services.where(cloud_service_type_id: cs_filter_attributes[:cloud_service_type_id]) unless cs_filter_attributes[:cloud_service_type_id].blank?





  end

end