// myBrand 컨트롤
function openBrand() {
    if (document.getElementById("myGender").style.opacity == "1") {
        closeGender();
    }
    document.getElementById("myBrand").style.top = "0px";
    document.getElementById("myBrand").style.opacity = "1";
    document.getElementById("myBrand").style.height = "600px";
}

function closeBrand() {
	if ( document.getElementById('myBrand') !== null ) {
    	document.getElementById("myBrand").style.top = "-600px";
    	document.getElementById("myBrand").style.opacity = "0";
    	document.getElementById("myBrand").style.height = "0px";
	}
}

// myGender 컨트롤
function controlGender() {
    if (document.getElementById("myGender").style.opacity == "1") {
        closeGender();
    } else if (document.getElementById("myGender").style.opacity == "0" || document.getElementById("myAccords").style.opacity == "1") {
        closeAccords();
        document.getElementById("myGender").style.top = "0";
        document.getElementById("myGender").style.opacity = "1";
        document.getElementById("myGender").style.height = "150px";
    }
}

function closeGender() {
    document.getElementById("myGender").style.top = "-200px";
    document.getElementById("myGender").style.opacity = "0";
    document.getElementById("myGender").style.height = "0px";
}

// myAccords 컨트롤
function controlAccords() {
    if (document.getElementById("myAccords").style.opacity == "1") {
        closeAccords();
    } else if (document.getElementById("myGender").style.opacity == "1" || document.getElementById("myAccords").style.opacity == "0") {
        closeGender();
        document.getElementById("myAccords").style.top = "0";
        document.getElementById("myAccords").style.opacity = "1";
        document.getElementById("myAccords").style.height = "300px";
    }
}

function closeAccords() {
    document.getElementById("myAccords").style.top = "-300px";
    document.getElementById("myAccords").style.opacity = "0";
    document.getElementById("myAccords").style.height = "0px";
}