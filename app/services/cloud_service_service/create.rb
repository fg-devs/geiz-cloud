class CloudServiceService::Create

  def self.build
    new
  end

  # Create a new cloud serivce
  def call(user, cs_attributes)

    # Remove all other Cloud Service Types depening on the selected Type
    # Ensures, that no additional attributes are saved.
    # For example, if a user would select checkboxes from multiple Cloud Service Types
    if cs_attributes[:cloud_service_type_id].to_i == CloudService::IAAS_ID
      cs_attributes.except!(:paas_category_ids)
      cs_attributes.except!(:saas_category_ids)
    elsif cs_attributes[:cloud_service_type_id].to_i == CloudService::PAAS_ID
      cs_attributes.except!(:iaas_attribute_attributes)
      cs_attributes.except!(:saas_category_ids)
    elsif cs_attributes[:cloud_service_type_id].to_i == CloudService::SAAS_ID
      cs_attributes.except!(:iaas_attribute_attributes)
      cs_attributes.except!(:paas_category_ids)
    end

    # Build Cloud Service model
    cs = CloudService.new(cs_attributes)
    cs.user = user

    # Save
    begin
      cs.save!
    rescue
        [false, cs]
    else
        [true, cs]
    end
  end

end