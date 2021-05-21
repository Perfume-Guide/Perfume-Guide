function openNav() {
    document.getElementById("mySearch").style.top = "0px";
    document.getElementById("mySearch").style.opacity = "1";

    document.getElementById("radio_brand").checked = false;
    document.getElementById("radio_name").checked = false;
    document.getElementById("radio_brand_label").style.fontWeight = "normal";
    document.getElementById("radio_name_label").style.fontWeight = "normal";

    document.getElementById("keyword1").value = "";
}

function closeNav() {
    document.getElementById("mySearch").style.top = "-350px";
    document.getElementById("mySearch").style.opacity = "0";

    document.getElementById("radio_brand").checked = false;
    document.getElementById("radio_name").checked = false;
    document.getElementById("radio_brand_label").style.fontWeight = "normal";
    document.getElementById("radio_name_label").style.fontWeight = "normal";

    document.getElementById("keyword1").value = "";
}