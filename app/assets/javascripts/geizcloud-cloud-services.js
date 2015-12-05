'use strict';

GeizCloud.CloudServices = (function() {

    var factory = {};

    /**
     * Sets a class to the form, to know which Cloud Service Type/Module is active
     * @param selectFormField
     */
    factory.setActiveCloudServiceType = function(selectFormField) {
        var $this = selectFormField;
        var createCloudServiceForm = $('#new_cloud_service');

        var selectedType = $this.find('option:selected').text().toLowerCase();

        createCloudServiceForm.removeClass('type-selected-iaas type-selected-paas type-selected-saas'); // Remove all classes
        createCloudServiceForm.addClass('type-selected-' + selectedType); // Add selected class
    };

    return factory;

})();