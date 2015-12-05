'use strict';

GeizCloud.Plugins = (function() {

    var factory = {};

    /**
     * NProgress (AJAX Loader for Turbolinks)
     */
    factory.initNProgress = function() {
        NProgress.configure({
            showSpinner: false
        });
    };

    /**
     * IChecks (Checkboxes)
     */
    factory.initIChecks = function() {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });
    };

    /**
     * Footables
     */
    factory.initFootables = function() {
        $('#footable-users').footable();
        $('#footable-cloud-services').footable();
    };


    return factory;

})();