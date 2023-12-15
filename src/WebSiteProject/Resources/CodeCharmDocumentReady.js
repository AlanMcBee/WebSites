(function ($) {
    $(document).ready(function () {
        if (typeof g_disableCheckoutInEditMode != 'undefined' && !g_disableCheckoutInEditMode) {
            $('.MoveToSliderZone').appendTo('#bt-slider>.container');
        }
    });
})(jQuery);
