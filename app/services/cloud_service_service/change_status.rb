class CloudServiceService::ChangeStatus

  def self.build
    new
  end

  # Updates the status (active/inactive) of a Cloud Service
  # @param [Object] id
  def call(id)
    cloud_service = CloudService.find(id)

    begin
      if cloud_service.active
        cloud_service.update_attributes!({active: false})
      else
        cloud_service.update_attributes!({active: true})
      end
    rescue
      [false, cloud_service]
    else
      [true, cloud_service]
    end
  end

end
