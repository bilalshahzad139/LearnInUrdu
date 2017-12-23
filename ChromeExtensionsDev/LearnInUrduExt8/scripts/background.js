//Recieve Message
chrome.runtime.onMessage.addListener(function (request, sender, response) {
    
    if (request.type == 1) {
        chrome.browserAction.setBadgeText({ text: request.ImgCount.toString() });
        //alert('Images found:' + request.ImgCount);
    }
    if (request.type == 2) {
        alert("User has searched: " + request.value);
    }

});