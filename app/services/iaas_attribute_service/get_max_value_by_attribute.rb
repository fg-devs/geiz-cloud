class IaasAttributeService::GetMaxValueByAttribute

  def self.build
    new
  end

  # Get maximum value by attribute (column)
  # @param [symbol|string] attribute
  def call(attribute)

    begin
      result = IaasAttribute.maximum(attribute)
    rescue
        0
    else
      if result.nil?
        0
      else
        result
      end
    end
  end

end
