module Admin::CloudServicesHelper

  # Is cloud service active
  def cloud_service_active?(cs)
    cs.active
  end

  # Is Cloud Service IaaS?
  def is_iaas?
    @cloud_service.cloud_service_type_id == CloudServiceType::IAAS_ID
  end

  # Is Cloud Service PaaS?
  def is_paas?
    @cloud_service.cloud_service_type_id == CloudServiceType::PAAS_ID
  end

  # Is Cloud Service SaaS?
  def is_saas?
    @cloud_service.cloud_service_type_id == CloudServiceType::SAAS_ID
  end

end
