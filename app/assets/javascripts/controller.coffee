'use strict'

# Ready function
ready = ->
  # Init Plugins
  GeizCloud.Plugins.initNProgress()
  GeizCloud.Plugins.initIChecks()
  GeizCloud.Plugins.initFootables()

  # Cloud Services
  GeizCloud.CloudServices.setActiveCloudServiceType $('#cloud_service_cloud_service_type_id')

  $(document).on 'change', '#cloud_service_cloud_service_type_id', ->
    GeizCloud.CloudServices.setActiveCloudServiceType $(this)
    return

  return

# Normal page load
$(document).ready ready

# Turbolinks on page load
$(document).on 'page:load', ready