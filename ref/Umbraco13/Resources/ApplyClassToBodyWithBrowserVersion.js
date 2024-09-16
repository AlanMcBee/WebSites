var nVer = navigator.appVersion;
var nAgt = navigator.userAgent;
var bN = navigator.appName;
var fullV = "" + parseFloat(navigator.appVersion);
var majorV = parseInt(navigator.appVersion, 10);
var nameOffset, verOffset, ix;
if ((verOffset = nAgt.indexOf("Opera")) !== -1) {
    bN = "Opera";
    fullV = nAgt.substring(verOffset + 6);
    if ((verOffset = nAgt.indexOf("Version")) !== -1) {
        fullV = nAgt.substring(verOffset + 8)
    }
} else {
    if ((verOffset = nAgt.indexOf("MSIE")) !== -1) {
        bN = "IE";
        fullV = nAgt.substring(verOffset + 5)
    } else {
        if ((verOffset = nAgt.indexOf("Chrome")) !== -1) {
            bN = "Chrome";
            fullV = nAgt.substring(verOffset + 7)
        } else {
            if ((verOffset = nAgt.indexOf("Safari")) !== -1) {
                bN = "Safari";
                fullV = nAgt.substring(verOffset + 7);
                if ((verOffset = nAgt.indexOf("Version")) !== -1) {
                    fullV = nAgt.substring(verOffset + 8)
                }
            } else {
                if ((verOffset = nAgt.indexOf("Firefox")) !== -1) {
                    bN = "Firefox";
                    fullV = nAgt.substring(verOffset + 8)
                } else {
                    if ((nameOffset = nAgt.lastIndexOf(" ") + 1) < (verOffset = nAgt.lastIndexOf("/"))) {
                        bN = nAgt.substring(nameOffset, verOffset);
                        fullV = nAgt.substring(verOffset + 1);
                        if (bN.toLowerCase() == bN.toUpperCase()) {
                            bN = navigator.appName
                        }
                    }
                }
            }
        }
    }
}
if ((ix = fullV.indexOf(";")) !== -1) {
    fullV = fullV.substring(0, ix)
}
if ((ix = fullV.indexOf(" ")) !== -1) {
    fullV = fullV.substring(0, ix)
}
majorV = parseInt("" + fullV, 10);
if (isNaN(majorV)) {
    fullV = "" + parseFloat(navigator.appVersion);
    majorV = parseInt(navigator.appVersion, 10)
}
document.getElementsByTagName("body")[0].className += " " + bN + " " + bN + majorV + " cmsUMB cmsUMB7 BT-pk";