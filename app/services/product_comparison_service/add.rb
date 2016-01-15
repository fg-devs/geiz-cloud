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
      product_comparison = ProductComparison.new({cloud_service_type_id: cloud_service.cloud_service_type_id, cloud_service_ids: Array.new})
    else
      product_comparison = ProductComparison.new(@session[:product_comparison])
    end


    if cloud_service.cloud_service_type_id != product_comparison.cloud_service_type_id
      [false, I18n.t('product_comparison.wrong_cs_type')]

    elsif product_comparison.cloud_service_ids.include?(cloud_service.id)
      [false, I18n.t('product_comparison.already_in_pc')]

    else
      product_comparison.cloud_service_ids << cloud_service.id
      @session[:product_comparison] = product_comparison

      [true, I18n.t('product_comparison.successfully_added')]
    end
  end

end