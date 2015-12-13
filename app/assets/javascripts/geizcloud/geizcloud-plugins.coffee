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


  ###*
  # Range sliders
  ###
  factory.initRangeSliders = (filterSettingsJSON) ->
    parsedFilterSettings = JSON.parse(filterSettingsJSON)

    $('#range-slider-price').ionRangeSlider
      type: "double"
      grid: true
      step: 10
      min: 0
      max: parsedFilterSettings.maxPrice
      postfix: ' ' + parsedFilterSettings.currency
      prettify_enable: true
      prettify_separator: '.'


    $('#range-slider-ram').ionRangeSlider
      type: "double"
      grid: true
      step: 1024
      min: 0
      max: parsedFilterSettings.maxRAM
      postfix: ' MB'
      prettify_enable: true
      prettify_separator: '.'

    $('#range-slider-cpu').ionRangeSlider
      type: 'double'
      grid: true
      step: 1
      min: 0
      max: parsedFilterSettings.maxCPU
      postfix: ' GHz'
      prettify_enable: true
      prettify_separator: '.'

    $('#range-slider-storage').ionRangeSlider
      type: 'double'
      grid: true
      step: 1024
      min: 0
      max: parsedFilterSettings.maxStorage
      postfix: ' MB'
      prettify_enable: true
      prettify_separator: '.'

    $('#range-slider-bandwidth').ionRangeSlider
      type: 'double'
      step: 50
      grid: true
      min: 0
      max: parsedFilterSettings.maxBandwidth
      postfix: ' Mbit/s'
      prettify_enable: true
      prettify_separator: '.'

    return

  factory