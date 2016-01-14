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

    # General footables
    $('.general-footable').footable
      empty: GeizCloud.Generated.locales.footableNoRows
      filtering:
        enabled: true
        delay: 200
        position: 'right'
        placeholder: GeizCloud.Generated.locales.footableSearchPlaceholder
      sorting:
        enabled: true
      paging:
        enabled: true
        size: 20
        countFormat: GeizCloud.Generated.locales.footablePagingCountFormat

    # General API footables
    $('.footable-api-users').footable
      empty: GeizCloud.Generated.locales.footableNoRows
      sorting:
        enabled: true

    # For cloud service filtering results
    $('.filter-cs-footable').footable
      empty: GeizCloud.Generated.locales.footableNoRows
      sorting:
        enabled: true
      paging:
        enabled: true
        size: 15
        countFormat: GeizCloud.Generated.locales.footablePagingCountFormat

    return

  ###*
  # Wysiwyq editor
  ###
  factory.initWysiwyg = ->
    $('#wysiwyg').wysihtml5
      locale: GeizCloud.Generated.locales.currentLocale + '-' + GeizCloud.Generated.locales.currentLocale.toUpperCase()
      toolbar:
        blockquote: false
        html: true
        size: 'xs'

    return

  ###
  # Bottstrap-show-password
  ###
  factory.togglePassword = ->
    $('.toggle-password').password()
    return


  ###*
  # Tooltips
  ###
  factory.initTooltips = ->
    $('[data-toggle="tooltip"]').tooltip()
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


  ###*
  # Handles AJAX Loader
  ###
  factory.ajaxLoader = do ->
    localObject = {}

    # Setup modal settings
    localObject.init = ->
      $('#ajax-loader-modal').modal
        backdrop: 'static'
        show: false
      return

    # Open modal
    localObject.openModal = ->
      $('#ajax-loader-modal').modal('show')
      return

    # Close modal
    localObject.closeModal = ->
      $('#ajax-loader-modal').modal('hide')
      return

    return localObject




  factory