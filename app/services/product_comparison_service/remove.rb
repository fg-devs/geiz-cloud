class ProductComparisonService::Remove

  # Depends on session object
  def self.build(session)
    new session
  end

  # Constructor
  def initialize(session)
    @session = session
  end

  # Removes a Cloud Service from product comparison
  # @param [int] id
  def call(id)
    product_comparison = ProductComparison.new(@session[:product_comparison])

    begin
      product_comparison.cloud_service_ids.delete(id.to_i)
    rescue
        [false, I18n.t('product_comparison.product_not_removed')]
    else
      # Clear session variable if no product inside
      product_comparison = nil if product_comparison.cloud_service_ids.blank?

      # Assign updated product comparison
      @session[:product_comparison] = product_comparison

      [true, I18n.t('product_comparison.product_successfully_removed')]
    end
  end

end