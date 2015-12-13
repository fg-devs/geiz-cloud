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
        ''
    else
      result
    end
  end

end
