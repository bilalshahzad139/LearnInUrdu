//https://developer.chrome.com/extensions/api_index


//chrome.windows
//chrome.tabs
//chrome.storage
//chrome.notifications  (https://developer.chrome.com/apps/notifications)




$(function () {
    $("#btnShowActive").click(function () {

        //Find Active Tab
        chrome.tabs.query({ 'active': true }, function (tabs) {
            var activeTab = tabs[0];
            alert(activeTab.id);
            alert(activeTab.url);
        });
        return false;
    });


    $("#btnChangetoLiU").click(function () {

        //Find Active Tab
        chrome.tabs.query({ 'active': true }, function (tabs) {
            chrome.tabs.update(tabs[0].id, { url: "http://learninginurdu.pk" });
        });

        return false;
    });


    $("#btnCountGoogle").click(function () {
        var count = 0;
        //populate: true means, load tabs against a window
        chrome.windows.getAll({ populate: true }, function (windows) {

            windows.forEach(function (window) {

                window.tabs.forEach(function (tab) {

                    if (tab.url && tab.url.toLowerCase().indexOf("google.com") >= 0) {
                        alert(tab.url);
                        count++;
                    }
                });
            });

            alert('Tabs found for google are:' + count);
        });

        return false;
    });



    $("#btnStoreValue").click(function () {

        var v = $("#txtValue").val();

        chrome.storage.local.set({ 'value': v }, function () {
            // Notify that we saved.
            $("#txtValue").val('');
            alert('Settings saved');
        });
        return false;
    });

    $("#btnGetValue").click(function () {

        chrome.storage.local.get('value', function (obj) {
            console.log(obj);
            $("#txtValue").val(obj.value);
        });
        return false;
    });

    if (Notification.permission !== "granted")
        Notification.requestPermission();

    $("#btnShowNot1").click(function () {

        chrome.notifications.create("1",
            {
                type: 'basic',
                iconUrl: 'icon.png',
                title: 'Welcome!!',
                message: 'Testing',
                buttons: [{ title: 'ok' }, { title: 'cancel' }]
                //, 'progress': 15
            },
            function () {


            });

        //var notification = new Notification('Welcome!', {
        //    icon: 'icon.png',
        //    type:'progress',
        //    body: "Welcome to LearningInUrdu.pk. Click on me to open site.",
        //    buttons: [{ title: 'ok' }, { title: 'cancel' }]
        //});

        //notification.onclick = function () {
        //    window.open("http://learninginurdu.pk");
        //};
        return false;
    });

    chrome.notifications.onClicked.addListener(function (notificationId) {
        alert(notificationId);
    });
    chrome.notifications.onButtonClicked.addListener(function (notificationId, buttonIndex) {
        alert(notificationId);
        alert(buttonIndex);
        if (notificationId == 1 && buttonIndex == 0) {
            //OK is clicked
            window.open("http://learninginurdu.pk");
        }
        else if (notificationId == 1 && buttonIndex == 1) {
            //Cancel is clicked
            chrome.notifications.clear("1");
        }

        
    });

    $("#btnShowNot2").click(function () {


        var notification = new Notification('Welcome!', {
            icon: 'icon.png',
            body: "Welcome to LearningInUrdu.pk. Click on me to open site."
        });

        notification.onclick = function () {
            window.open("http://learninginurdu.pk");
        };
        return false;
    });


    $("#btnInjectScript").click(function () {

        chrome.tabs.executeScript({ file: "scripts/content.js" });

        return false;
    });

    $("#btnInjectCode").click(function () {

        chrome.tabs.executeScript({ code: "alert('hello');" });

        return false;
    });
});//End of DOM Ready function

