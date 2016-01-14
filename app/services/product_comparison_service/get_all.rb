class ProductComparisonService::GetAll

  # Depends on session and CloudServiceService
  def self.build(session)
    new session, CloudServiceService::GetSingle.build
  end

  # Constructor
  def initialize(session, cloud_service)
    @session = session
    @cloud_service_service = cloud_service
  end

  # Adds a Cloud Service to product comparison
  def call
    product_comparison = ProductComparison.new(@session[:product_comparison])
    pp product_comparison

    # Return empty array if session variable does not exist
    if product_comparison.cloud_service_type_id.blank?
      [false, []]
    else
      cloud_services = Array.new

      product_comparison.cloud_service_ids.each do |id|
        cloud_services.push @cloud_service_service.call id
      end

      [true, cloud_services]
    end
  end

end