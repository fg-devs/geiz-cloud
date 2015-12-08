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


  $(document).on 'change', '#filter_cloud_services', ->
    console.log("changed")
    $(this).submit()
    return


  $("#filter_cloud_services").on("ajax:success", (e, data, status, xhr) ->
    console.log(data);
    #$("#new_article").append xhr.responseText
    return
  ).on "ajax:error", (e, xhr, status, error) ->
  $("#new_article").append "<p>ERROR</p>"




  return

# Normal page load
$(document).ready ready

# Turbolinks on page load
$(document).on 'page:load', ready