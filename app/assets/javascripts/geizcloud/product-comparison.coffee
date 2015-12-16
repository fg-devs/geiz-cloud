'use strict'

@GeizCloud.ProductComparison = do ->
  factory = {}

  # Handle response after user clicked on adding a product to product comparison
  factory.handleAddRespone = ->
    $('#add-to-product-comparison')
      .on('ajax:success', (e, data, status, xhr) ->

        # Append or replace
        if $('#product-comparison-modal').length
          $('#product-comparison-modal').replaceWith data
        else
          $('body').append data

        # Open Modal
        $('#product-comparison-modal').modal()
        return
    )

    return

  factory