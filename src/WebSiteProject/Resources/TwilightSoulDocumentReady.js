$(document).ready(function () {
    //MovePageTitle
    if (typeof g_disableCheckoutInEditMode != 'undefined' && !g_disableCheckoutInEditMode) {
        $('.MoveToTitleZone').appendTo('#bt-pagetitle>.container');
    }

    if ($('body').hasClass('cmsSP')) {
        var pageTitle = '<h1>' + $('#Logo > .ms-core-pageTitle > span').text() + '</h1>';
        $('#PageTitleZone').html(pageTitle);
    }
});