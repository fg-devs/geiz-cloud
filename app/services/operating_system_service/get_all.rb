class OperatingSystemService::GetAll

  def self.build
    new
  end

  # Get all Operating Systems
  def call
    OperatingSystem.all
  end

end