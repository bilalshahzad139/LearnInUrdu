



$(function () {

    $("#btnSet").click(function () {
        var c = $("#txtColor").val();

        //Send Message to current active tab
        chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
            chrome.tabs.sendMessage(tabs[0].id, {type: 'changecolor',color:c}, function (resp) {
                
            });
        });

        return false;
    });



    //Get images from the page
    chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
        chrome.tabs.sendMessage(tabs[0].id, { type: 'getimages' }, function (images) {
            for (var i = 0; i < images.length; i++) {
                var imgurl = images[i];

                var $img = $("<img>").attr('src', imgurl);
                $(".images").append($img);
            }
        });
    });




});


