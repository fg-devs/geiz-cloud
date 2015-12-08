module Shared
  module CloudServicesHelper

    # Is Cloud Service IaaS?
    def is_iaas?(cs)
      cs.cloud_service_type_id == CloudServiceType::IAAS_ID
    end

    # Is Cloud Service PaaS?
    def is_paas?(cs)
      cs.cloud_service_type_id == CloudServiceType::PAAS_ID
    end

    # Is Cloud Service SaaS?
    def is_saas?(cs)
      cs.cloud_service_type_id == CloudServiceType::SAAS_ID
    end

  end
end

