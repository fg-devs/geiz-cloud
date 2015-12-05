'use strict';

/**
 * Global GeizCloud variable with all modules
 */
var GeizCloud = {
    Plugins: {},
    CloudServices: {}
};


// Normal page load
// IMPORTANT: Bind jQuery event handlers always to document.
// Otherwise we would have to add the same could again, to on page:load
$(document).ready(function() {

    // Init Plugins
    GeizCloud.Plugins.initNProgress();
    GeizCloud.Plugins.initIChecks();
    GeizCloud.Plugins.initFootables();


    // Cloud Services
    GeizCloud.CloudServices.setActiveCloudServiceType($('#cloud_service_cloud_service_type_id'));

    $(document).on('change', '#cloud_service_cloud_service_type_id', function() {
        GeizCloud.CloudServices.setActiveCloudServiceType($(this));
    });

});


// Turbolinks on page load
$(document).on('page:load', function() {

    // Init Plugins
    GeizCloud.Plugins.initNProgress();
    GeizCloud.Plugins.initIChecks();
    GeizCloud.Plugins.initFootables();


    // Cloud Services
    GeizCloud.CloudServices.setActiveCloudServiceType($('#cloud_service_cloud_service_type_id'));
});