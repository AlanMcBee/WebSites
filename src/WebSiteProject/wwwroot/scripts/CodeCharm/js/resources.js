(function (b) {
    b(document).ready(function () {
        setInterval(function () { var a = b("footer").outerHeight(true) + 30; b(".theme-wrapper").css("padding-bottom", a) },
        1000)
    })
})(jQuery);
