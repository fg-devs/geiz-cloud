class ProductComparisonService::Empty

  # Depends on session object
  def self.build(session)
    new session
  end

  # Constructor
  def initialize(session)
    @session = session
  end

  # Removes all Cloud Service from product comparison
  def call
    @session[:product_comparison] = nil
  end

end