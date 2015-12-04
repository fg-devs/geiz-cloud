'use strict';
$(document).ready(function() {

    // TODO: REFACTOR...


    // Init footable for user table
    $('#footable-users').footable();

    // Init Checkbox plugin
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    });


    setActiveCloudServiceType($('#cloud_service_cloud_service_type_id'));


    $(document).on('change', '#cloud_service_cloud_service_type_id', function() {
        setActiveCloudServiceType($(this));
    });

});


$(document).on('page:load', function() {

    // Init footable for user table
    $('#footable-users').footable();

    // Init Checkbox plugin
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    });

    setActiveCloudServiceType($('#cloud_service_cloud_service_type_id'));

});




function setActiveCloudServiceType(selectFormField) {
    var $this = selectFormField;
    var createCloudServiceForm = $('#new_cloud_service');

    var selectedType = $this.find('option:selected').text().toLowerCase();

    createCloudServiceForm.removeClass('type-selected-iaas type-selected-paas type-selected-saas'); // Remove all classes
    createCloudServiceForm.addClass('type-selected-' + selectedType); // Add selected class
}