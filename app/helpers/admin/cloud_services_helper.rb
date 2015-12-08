module Admin::CloudServicesHelper

  # Is cloud service active
  def cloud_service_active?(cs)
    cs.active
  end

end
