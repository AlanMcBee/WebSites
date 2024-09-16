/*!
* parallax.js v1.4.2 (http://pixelcog.github.io/parallax.js/)
* @copyright 2016 PixelCog, Inc.
* @license MIT (https://github.com/pixelcog/parallax.js/blob/master/LICENSE)
*/
(function (l, m, i, j) {
    (function () {
        var b = 0; var a = ["ms", "moz", "webkit", "o"]; for (var c = 0; c < a.length && !m.requestAnimationFrame; ++c) { m.requestAnimationFrame = m[a[c] + "RequestAnimationFrame"]; m.cancelAnimationFrame = m[a[c] + "CancelAnimationFrame"] || m[a[c] + "CancelRequestAnimationFrame"] }

        if (!m.requestAnimationFrame) {
            m.requestAnimationFrame = function (g) {
                var f = new Date().getTime();
                var e = Math.max(0, 16 - (f - b));
                var d = m.setTimeout(function () { g(f + e) },
                e);
                b = f + e; return d
            }
        }

        if (!m.cancelAnimationFrame) { m.cancelAnimationFrame = function (d) { clearTimeout(d) } }
    }());
    function k(c, d) {
        var e = this;
        if (typeof d == "object") { delete d.refresh; delete d.render; l.extend(this, d) }
        this.$element = l(c);

        if (!this.imageSrc && this.$element.is("img")) { this.imageSrc = this.$element.attr("src") }
        var f = (this.position + "").toLowerCase().match(/\S+/g) || [];
        if (f.length < 1) { f.push("center") }

        if (f.length == 1) { f.push(f[0]) }

        if (f[0] == "top" || f[0] == "bottom" || f[1] == "left" || f[1] == "right") { f = [f[1], f[0]] }

        if (this.positionX != j) { f[0] = this.positionX.toLowerCase() }

        if (this.positionY != j) { f[1] = this.positionY.toLowerCase() }
        e.positionX = f[0]; e.positionY = f[1];
        if (this.positionX != "left" && this.positionX != "right") {
            if (isNaN(parseInt(this.positionX))) { this.positionX = "center" }
            else { this.positionX = parseInt(this.positionX) }
        }

        if (this.positionY != "top" && this.positionY != "bottom") {
            if (isNaN(parseInt(this.positionY))) { this.positionY = "center" }
            else { this.positionY = parseInt(this.positionY) }
        }
        this.position = this.positionX + (isNaN(this.positionX) ? "" : "px") + " " + this.positionY + (isNaN(this.positionY) ? "" : "px");

        if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) {
            if (this.imageSrc && this.iosFix && !this.$element.is("img")) { this.$element.css({ backgroundImage: "url(" + this.imageSrc + ")", backgroundSize: "cover", backgroundPosition: this.position }) }
            return this
        }

        if (navigator.userAgent.match(/(Android)/)) {
            if (this.imageSrc && this.androidFix && !this.$element.is("img")) { this.$element.css({ backgroundImage: "url(" + this.imageSrc + ")", backgroundSize: "cover", backgroundPosition: this.position }) }
            return this
        }
        this.$mirror = l("<div />").prependTo(c);
        var b = this.$element.find(">.parallax-slider");
        var a = false;
        if (b.length == 0) { this.$slider = l("<img />").prependTo(this.$mirror) }
        else {
            this.$slider = b.prependTo(this.$mirror);
            a = true
        }
        this.$mirror.addClass("parallax-mirror").css({ visibility: "hidden", zIndex: this.zIndex, position: "absolute", top: 0, left: 0, overflow: "visible" });
        this.$slider.addClass("parallax-slider").one("load", function () {
            if (!e.naturalHeight || !e.naturalWidth) { e.naturalHeight = this.naturalHeight || this.height || 1; e.naturalWidth = this.naturalWidth || this.width || 1 }
            e.aspectRatio = e.naturalWidth / e.naturalHeight; k.isSetup || k.setup();
            k.sliders.push(e);
            k.isFresh = false; k.requestRender()
        });

        if (!a) { this.$slider[0].src = this.imageSrc }

        if (this.naturalHeight && this.naturalWidth || this.$slider[0].complete || b.length > 0) { this.$slider.trigger("load") }
    }
    l.extend(k.prototype, {
        speed: 0.7, bleed: 0, zIndex: 0, iosFix: true, androidFix: true, position: "center", overScrollFix: false, refresh: function () {
            this.boxWidth = this.$element.outerWidth();
            this.boxHeight = this.$element.outerHeight() + this.bleed * 2; this.boxOffsetTop = this.$element.offset().top - this.bleed; this.boxOffsetLeft = this.$element.offset().left; this.boxOffsetBottom = this.boxOffsetTop + this.boxHeight; var d = k.winHeight; var c = k.docHeight; var b = Math.min(this.boxOffsetTop, c - d);
            var g = Math.max(this.boxOffsetTop + this.boxHeight - d, 0);
            var f = this.boxHeight + (b - g) * (1 - this.speed) | 0; var e = (this.boxOffsetTop - b) * (1 - this.speed) | 0;
            if (f * this.aspectRatio >= this.boxWidth) {
                this.imageWidth = f * this.aspectRatio | 0; this.imageHeight = f; this.offsetBaseTop = e; var a = this.imageWidth - this.boxWidth;
                if (this.positionX == "left") { this.offsetLeft = 0 }
                else {
                    if (this.positionX == "right") { this.offsetLeft = -a }
                    else {
                        if (!isNaN(this.positionX)) { this.offsetLeft = Math.max(this.positionX, -a) }
                        else { this.offsetLeft = -a / 2 | 0 }
                    }
                }
            }
            else {
                this.imageWidth = this.boxWidth; this.imageHeight = this.boxWidth / this.aspectRatio | 0; this.offsetLeft = 0; var a = this.imageHeight - f;
                if (this.positionY == "top") { this.offsetBaseTop = e }
                else {
                    if (this.positionY == "bottom") { this.offsetBaseTop = e - a }
                    else {
                        if (!isNaN(this.positionY)) { this.offsetBaseTop = e + Math.max(this.positionY, -a) }
                        else { this.offsetBaseTop = e - a / 2 | 0 }
                    }
                }
            }
        },
        render: function () {
            var b = k.scrollTop; var a = k.scrollLeft; var d = this.overScrollFix ? k.overScroll : 0; var c = b + k.winHeight;
            if (this.boxOffsetBottom > b && this.boxOffsetTop <= c) { this.visibility = "visible"; this.mirrorTop = this.boxOffsetTop - b; this.mirrorLeft = this.boxOffsetLeft - a; this.offsetTop = this.offsetBaseTop - this.mirrorTop * (1 - this.speed) }
            else { this.visibility = "hidden" }
            this.$mirror.css({ transform: "translate3d(0px, 0px, 0px)", visibility: this.visibility, top: this.mirrorTop - d, left: this.mirrorLeft, height: this.boxHeight, width: this.boxWidth });
            this.$slider.css({ transform: "translate3d(0px, 0px, 0px)", position: "absolute", top: this.offsetTop, left: this.offsetLeft, height: this.imageHeight, width: this.imageWidth, maxWidth: "none" })
        }
    });
    l.extend(k, {
        scrollTop: 0, scrollLeft: 0, winHeight: 0, winWidth: 0, docHeight: 1 << 30, docWidth: 1 << 30, sliders: [], isReady: false, isFresh: false, isBusy: false, setup: function () {
            if (this.isReady) { return }
            var a = l(i),
            b = l(m);
            var c = function () {
                k.winHeight = b.height();
                k.winWidth = b.width();
                k.docHeight = a.height();
                k.docWidth = a.width()
            };
            var d = function () {
                var f = b.scrollTop();
                var e = k.docHeight - k.winHeight; var g = k.docWidth - k.winWidth; k.scrollTop = Math.max(0, Math.min(e, f));
                k.scrollLeft = Math.max(0, Math.min(g, b.scrollLeft()));
                k.overScroll = Math.max(f - e, Math.min(f, 0))
            };
            b.on("resize.px.parallax load.px.parallax", function () {
                c();
                k.isFresh = false; k.requestRender()
            }).on("scroll.px.parallax load.px.parallax", function () {
                d();
                k.requestRender()
            });
            c();
            d();
            this.isReady = true
        },
        configure: function (a) {
            if (typeof a == "object") { delete a.refresh; delete a.render; l.extend(this.prototype, a) }
        },
        refresh: function () {
            l.each(this.sliders, function () { this.refresh() });
            this.isFresh = true
        },
        render: function () {
            this.isFresh || this.refresh();
            l.each(this.sliders, function () { this.render() })
        },
        requestRender: function () {
            var a = this;
            if (!this.isBusy) {
                this.isBusy = true; m.requestAnimationFrame(function () {
                    a.render();
                    a.isBusy = false
                })
            }
        },
        destroy: function (b) {
            var c, a = l(b).data("px.parallax");
            a.$mirror.remove();
            for (c = 0; c < this.sliders.length; c += 1) {
                if (this.sliders[c] == a) { this.sliders.splice(c, 1) }
            }
            l(b).data("px.parallax", false);

            if (this.sliders.length === 0) {
                l(m).off("scroll.px.parallax resize.px.parallax load.px.parallax");
                this.isReady = false; k.isSetup = false
            }
        }
    });
    function n(a) {
        return this.each(function () {
            var b = l(this);
            var c = typeof a == "object" && a;
            if (this == m || this == i || b.is("body")) { k.configure(c) }
            else {
                if (!b.data("px.parallax")) {
                    c = l.extend({},
                    b.data(),
                    c);
                    b.data("px.parallax", new k(this, c))
                }
                else {
                    if (typeof a == "object") {
                        l.extend(b.data("px.parallax"),
                        c)
                    }
                }
            }

            if (typeof a == "string") {
                if (a == "destroy") { k.destroy(this) }
                else { k[a]() }
            }
        })
    }
    var h = l.fn.parallax; l.fn.parallax = n; l.fn.parallax.Constructor = k; l.fn.parallax.noConflict = function () { l.fn.parallax = h; return this };
    l(i).on("ready.px.parallax.data-api", function () { l('[data-parallax="scroll"]').parallax() })
}(jQuery, window, document));
(function (b) {
    b(document).ready(function () {
        var a = b("img[data-bt-parallax]");

        if (a.length) {
            a.each(function () {
                var k = b(this).attr("src");
                var j = b(this).attr("data-bt-parallax");

                if (j.indexOf("#") >= 0) { var i = b(j) }
                else { var i = b("#" + j) }

                if (b(this).attr("height")) { var m = b(this).attr("height") }
                else { var m = "100%" }

                if (b(this).attr("width")) { var l = b(this).attr("width") }
                else { var l = "100%" }

                if (b(this).attr("data-bt-parallax-speed")) { var n = b(this).attr("data-bt-parallax-speed") }
                else { var n = 0.65 }
                b(this).css("display", "none");

                if (i.length) {
                    i.width(l);
                    i.height(m);
                    i.parallax({ imageSrc: k, speed: n });
                    b("body").append("<style>.BTparallaxAdjust{visibility:visible!important;top:0px!important;left:0px!important;}</style>");
                    b(".parallax-mirror").addClass("BTparallaxAdjust");
                    i.css({ background: "none", position: "relative", overflow: "hidden" })
                }
                else { b(this).css("visibility", "visible") }
            })
        }
    })
})(jQuery);
