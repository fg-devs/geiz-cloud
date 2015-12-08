'use strict'

@GeizCloud.CloudServices = do ->
  factory = {}

  ###*
  # Sets a class to the form, to know which Cloud Service Type/Module is active
  # @param selectFormField
  ###
  factory.setActiveCloudServiceType = (selectFormField) ->
    $this = selectFormField
    createCloudServiceForm = $('#new_cloud_service')
    selectedType = $this.find('option:selected').text().toLowerCase()

    # Remove all classes
    createCloudServiceForm.removeClass 'type-selected-iaas type-selected-paas type-selected-saas'

    # Add selected class
    createCloudServiceForm.addClass 'type-selected-' + selectedType
    return

  factory