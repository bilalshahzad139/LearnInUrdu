

chrome.runtime.onMessage.addListener(function (request, sender, response) {
    

    if (request.type == 'changecolor') {
        $("body").css("background-color", request.color);
    }
    else if (request.type == 'getimages') {
        var arr = [];
        $("img").each(function () {
            //arr.push($(this).attr('src'));
            arr.push($(this)[0].src);
        });

        response(arr);
    }

});


var c = $("img").length;
chrome.runtime.sendMessage({ type: 1, ImgCount: c });



$("input[name=btnK]").bind('click', function () {
    var t = $("#lst-ib").val();
    chrome.runtime.sendMessage({ type: 2, value: t });
});