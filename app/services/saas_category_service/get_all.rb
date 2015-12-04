class SaasCategoryService::GetAll

  def self.build
    new
  end

  # Get all SaaS cateogries
  def call
    SaasCategory.all
  end

end