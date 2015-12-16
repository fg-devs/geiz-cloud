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
    session_hash = nil
    session_hash = @session[:product_comparison].symbolize_keys unless @session[:product_comparison].nil?

    # Return empty array if session variable does not exist
    if session_hash.blank?
      [false, []]
    else
      cloud_services = Array.new

      session_hash[:cloud_service_ids].each do |id|
        cloud_services.push @cloud_service_service.call id
      end

      @session[:product_comparison] = session_hash

      [true, cloud_services]
    end
  end

end