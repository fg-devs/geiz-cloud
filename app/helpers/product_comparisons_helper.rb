module ProductComparisonsHelper

  # Calculate the column size for the features column
  def calc_feature_col(cloud_services)
    (9 % cloud_services.size == 0) ? 3 : 4
  end

  # Calculate the column size for actual Cloud Services
  def calc_data_col(cloud_services)
    9 / cloud_services.size
  end

  # Check if cloud_service is PaaS category
  def has_paas_category?(cloud_service, paas_category)
    cloud_service.paas_categories.any? { |position| position.id == paas_category.id }
  end

  # Check if cloud_service is SaaS category
  def has_saas_category?(cloud_service, saas_category)
    cloud_service.saas_categories.any? { |position| position.id == saas_category.id }
  end

end
