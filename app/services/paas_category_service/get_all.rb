class PaasCategoryService::GetAll

  def self.build
    new
  end

  # Get all PaaS cateogries
  def call
    PaasCategory.all
  end

end