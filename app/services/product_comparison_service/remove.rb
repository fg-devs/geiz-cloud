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
    session_hash = @session[:product_comparison].symbolize_keys

    begin
      session_hash[:cloud_service_ids].delete(id.to_i)
    rescue
        [false, I18n.t('product_comparison.product_not_removed')]
    else
      # Clear session variable if no product inside
      session_hash = nil if session_hash[:cloud_service_ids].blank?

      # Assign session variable
      @session[:product_comparison] = session_hash

      [true, I18n.t('product_comparison.product_successfully_removed')]
    end
  end

end