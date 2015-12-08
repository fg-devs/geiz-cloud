'use strict'

@GeizCloud.Plugins = do ->
  factory = {}

  ###*
  # NProgress (AJAX Loader for Turbolinks)
  ###
  factory.initNProgress = ->
    NProgress.configure showSpinner: false
    return

  ###*
  # IChecks (Checkboxes)
  ###
  factory.initIChecks = ->
    $('.i-checks').iCheck
      checkboxClass: 'icheckbox_square-green'
      radioClass: 'iradio_square-green'
    return

  ###*
  # Footables
  ###
  factory.initFootables = ->
    $('#footable-users').footable()
    $('#footable-cloud-services').footable()
    return

  factory