class ProductComparisonService::Add

  # Depends on session object
  def self.build(session)
    new session
  end

  # Constructor
  def initialize(session)
    @session = session
  end

  # Add a Cloud Service to product comparison
  # @param [CloudService] cloud_service
  def call(cloud_service)

    # Get product comparison session or create initial value with new product
    if @session[:product_comparison].nil?
      session_hash = {
          cloud_service_type_id: cloud_service.cloud_service_type_id,
          cloud_service_ids: Array.new
      }
    else
      session_hash = @session[:product_comparison].symbolize_keys
    end


    if cloud_service.cloud_service_type_id != session_hash[:cloud_service_type_id]
      [false, I18n.t('product_comparison.wrong_cs_type')]

    elsif session_hash[:cloud_service_ids].include?(cloud_service.id)
      [false, I18n.t('product_comparison.already_in_pc')]

    else
      session_hash[:cloud_service_ids] << cloud_service.id
      @session[:product_comparison] = session_hash

      [true, I18n.t('product_comparison.successfully_added')]
    end
  end

end