


$(function () {
    chrome.storage.local.get('name', function (obj) {
        if (obj && obj.name) {
            $("#spWelcomeMsg").text('Welcome ' + obj.name);
        }
    });

});//End of DOM Ready function

