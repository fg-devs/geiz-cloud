class CloudServiceService::Update

  def self.build
    new
  end

  # Updates a single cloud service
  # @param [Object] id
  # @param [Object] cs_attributes
  def call(id, cs_attributes)
    cs = CloudService.find(id)

    # Remove all other Cloud Service Types depening on the selected Type
    # Ensures, that no additional attributes are send and saved.
    if cs_attributes[:cloud_service_type_id].to_i == CloudServiceType::IAAS_ID
      cs_attributes.except!(:paas_category_ids)
      cs_attributes.except!(:saas_category_ids)
    elsif cs_attributes[:cloud_service_type_id].to_i == CloudServiceType::PAAS_ID
      cs_attributes.except!(:iaas_attribute_attributes)
      cs_attributes.except!(:saas_category_ids)
    elsif cs_attributes[:cloud_service_type_id].to_i == CloudServiceType::SAAS_ID
      cs_attributes.except!(:iaas_attribute_attributes)
      cs_attributes.except!(:paas_category_ids)
    end

    begin
      cs.update_attributes!(cs_attributes)
    rescue
      [false, cs]
    else
      [true, cs]
    end
  end

end
