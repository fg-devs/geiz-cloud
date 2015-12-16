class CsAttributeWeighting < ActiveRecord::Base


  # Calculate Cloud Credits for IaaS offer
  def self.calc_iaas_credits(cloud_service)
    weighting = CsAttributeWeighting.find(1)

    sum = weighting.ram           * cloud_service.iaas_attribute.ram
    sum += weighting.cpu          * cloud_service.iaas_attribute.cpu
    sum += weighting.storage      * cloud_service.iaas_attribute.cpu
    sum += weighting.bandwidth    * cloud_service.iaas_attribute.bandwidth

    (sum / cloud_service.price).round
  end

  # Calculate Cloud Credits for PaaS offer
  def self.calc_paas_credits(cloud_service)
    sum = (cloud_service.paas_categories.size / cloud_service.price) * 100
    sum.round
  end

  # Calculate Cloud Credits for SaaS offer
  def self.calc_saas_credits(cloud_service)
    sum = (cloud_service.saas_categories.size / cloud_service.price) * 100
    sum.round
  end

end
