'use strict'

@GeizCloud.CloudServices = do ->
  factory = {}

  ###*
  # Sets a class to the form, to know which Cloud Service Type/Model is active
  # @param selectFormField
  ###
  factory.setActiveCloudServiceType = (selectFormField) ->
    createCloudServiceForm = $('.form-cloud-services')
    selectedTypeValue = parseInt(selectFormField.find('option:selected').val())

    selectedType = 'none' if isNaN(selectedTypeValue)
    selectedType = 'iaas' if selectedTypeValue == 1
    selectedType = 'paas' if selectedTypeValue == 2
    selectedType = 'saas' if selectedTypeValue == 3

    # Remove all classes
    createCloudServiceForm.removeClass 'none-active iaas-active paas-active saas-active'

    # Add selected class
    createCloudServiceForm.addClass selectedType + '-active'
    return


  ###*
  # Sends the form on changing a field in search view
  # @param filterForm
  ###
  factory.sendFilterFormOnChange = (filterForm) ->
    filterForm.submit()
    return

  factory