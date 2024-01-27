(function (b) {
    b(document).ready(function () {
        var i = b("body").outerHeight(true);
        var m = i + "px"; var n = b("#Search").find("input");
        var j = b("#Search").find('input[type="text"]');
        var k = b("#Search").find('input[type="submit"]');
        previousLogoHeight = 0; scrollChange = 50; logoUndefined = true;
        if (!j.attr("placeholder")) { j.attr("placeholder", "Search here...").val("") }

        if (!k.val()) { k.val("Search") }
        iframeSeek = true; function l() {
            if (b("iframe#iPopUp").contents().find("iframe#dnn_ctr362_EditHTML_txtContent_txtContent_contentIframe").contents().length && iframeSeek) {
                b("iframe#iPopUp").contents().find("iframe#dnn_ctr362_EditHTML_txtContent_txtContent_contentIframe").contents().find("body").attr("style", "background-color:#222!important");
                b("iframe#iPopUp").contents().find("body").append("<style>div.reEditorModes .reMode_selected span{color:#fff!important}</style>");
                iframeSeek = false
            }
            var f = b("footer").outerHeight(true);
            var d = f + "px";
            if (b("#Logo").find("img").length) {
                logoHeight = b("#Logo").find("img").outerHeight(true);
                logoHeightPX = b("#Logo").find("img").outerHeight() + "px"
            }
            else { logoHeight = 80; logoHeightPX = "40px" }

            if (!(b("header.navbar").hasClass("slim-nav"))) {
                var g = b("header").outerHeight(true);
                var e = g + "px";
                if (logoHeight === previousLogoHeight && logoUndefined) {
                    b("#Logo").find("img").height(logoHeightPX);
                    logoUndefined = false
                }

                if (logoHeight > previousLogoHeight) {
                    previousLogoHeight = logoHeight;
                    if (logoHeight >= 20) {
                        b(".search-placeholder").css("line-height", logoHeight + "px");
                        n.css("height", logoHeight + "px");
                        b("#MenuH").find("ul").first().children("li").each(function () {
                            b(this).children("a").css("line-height", logoHeight + "px");
                            b(this).children("span").css("line-height", logoHeight + "px")
                        })
                    }
                }
                windowHeight = b(window).height();
                function c(h) { return !b.trim(h.html()) }

                if (!(c(b("#bt-slider")))) { b("#bt-slider").height(windowHeight) }

                if (g >= 106) { b("#bt-slider").css({ "min-height": g + "px", "max-height": windowHeight + "px" }) }
                scrollChange = parseFloat(windowHeight) - parseFloat(g);

                if (scrollChange < 50) { scrollChange = 50 }
            }
            b(".theme-wrapper").css("padding-bottom", d)
        }
        l();
        setInterval(function () { l() },
        1000);
        var a = false; b(document).on("scroll", function () {
            if (b("#bt-main").hasClass("main-page")) {
                if (b(document).scrollTop() >= scrollChange && a === false) {
                    b(".navbar").addClass("slim-nav");
                    a = true
                }

                if (b(document).scrollTop() < scrollChange && a) {
                    b(".navbar").removeClass("slim-nav");
                    a = false
                }
            }
        });
        b("body").resize(function () {
            if (this.resizeTO) { clearTimeout(this.resizeTO) }
            this.resizeTO = setTimeout(function () { b(this).trigger("resizeEnd") },
            100)
        });
        b("body").bind("resizeEnd", function () {
            var d = b("footer").outerHeight(true);
            var c = d + "px"; b(".theme-wrapper").css("padding-bottom", c)
        });
        b(".image-wrapper").mouseover(function () { b(this).addClass("perspective") });
        b(".image-wrapper").mouseout(function () { b(this).removeClass("perspective") });
        b(".search-placeholder").on("click", function () {
            b(this).toggleClass("search-active");
            b("#Search, #MenuH").toggleClass("search-active")
        })
    })
})(jQuery);
