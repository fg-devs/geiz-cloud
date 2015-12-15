'use strict'

# Ready function
ready = ->
  # Init Plugins
  GeizCloud.Plugins.initNProgress()
  GeizCloud.Plugins.initIChecks()
  GeizCloud.Plugins.initFootables()

  # Product Comparison Stuff
  GeizCloud.ProductComparison.handleAddRespone()

  # Cloud Services Set Active Cloud Service Type
  GeizCloud.CloudServices.setActiveCloudServiceType $('.select-cloud-service-type')

  $(document).on 'change', '.select-cloud-service-type', ->
    GeizCloud.CloudServices.setActiveCloudServiceType $(this)
    return


  # Send form on changing type in search view
  $(document).on 'change', '#filter-cloud-services', ->
    GeizCloud.CloudServices.sendFilterFormOnChange $(this)
    return

  $(document).on 'ifChanged', '#filter-cloud-services input[type="checkbox"]', ->
    GeizCloud.CloudServices.sendFilterFormOnChange $(this)
    return

  return

# Normal page load
$(document).ready ready

# Turbolinks on page load
$(document).on 'page:load', ready