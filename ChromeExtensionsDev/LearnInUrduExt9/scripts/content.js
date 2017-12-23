

chrome.storage.local.get('name', function (obj) {
    console.log(obj);

    if (obj && obj.name) {
        $("body").prepend("<h1>Welcome " + obj.name + "</h1>");
    }
});


//var imgURL = chrome.extension.getURL("icon.png");
//var $img = $("<img>").attr('src', imgURL);
//$("body").prepend($img);


//var imgURL = chrome.extension.getURL("icon.png");
//$("#hplogo").get(0).src = imgURL;