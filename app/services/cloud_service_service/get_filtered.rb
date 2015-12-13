class CloudServiceService::GetFiltered

  def self.build
    new
  end

  # Get all Cloud Services filtered
  def call(cs_filter_attributes)

    filtered_cs = CloudService.is_active
    filtered_cs = filtered_cs.by_cs_type cs_filter_attributes[:cloud_service_type_id]
    filtered_cs = filtered_cs.by_price cs_filter_attributes[:price].split(';')

    # Filter only if type is Iaas
    if cs_filter_attributes[:cloud_service_type_id].to_i == CloudServiceType::IAAS_ID
      # OS
      filtered_cs = filtered_cs.by_operating_system cs_filter_attributes[:iaas_attributes][:operating_system_id]

      # RAM (is send via a single input field, from and to delimited by ';')
      filtered_cs = filtered_cs.by_ram cs_filter_attributes[:iaas_attributes][:ram].split(';')

      # CPU (is send via a single input field, from and to delimited by ';')
      filtered_cs = filtered_cs.by_cpu cs_filter_attributes[:iaas_attributes][:cpu].split(';')

      # Storage (is send via a single input field, from and to delimited by ';')
      filtered_cs = filtered_cs.by_storage cs_filter_attributes[:iaas_attributes][:storage].split(';')

      # Bandwidth (is send via a single input field, from and to delimited by ';')
      filtered_cs = filtered_cs.by_bandwidth cs_filter_attributes[:iaas_attributes][:bandwidth].split(';')

    # Filter only if type is PaaS
    elsif cs_filter_attributes[:cloud_service_type_id].to_i == CloudServiceType::PAAS_ID
      filtered_cs = filtered_cs.by_paas_categories cs_filter_attributes[:paas_category_ids]

    # Filter only if type is SaaS
    elsif cs_filter_attributes[:cloud_service_type_id].to_i == CloudServiceType::SAAS_ID
      filtered_cs = filtered_cs.by_saas_categories cs_filter_attributes[:saas_category_ids]
    end

    filtered_cs
  end

end