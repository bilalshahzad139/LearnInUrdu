$(function () {

    //Get & Set options if available (already saved)
    chrome.storage.local.get('name', function (obj) {
        console.log(obj);
        
        if (obj && obj.name) {
            $("#txtName").val(obj.name);
        }
    });

    $("#btnSave").click(function () {
        var v = $("#txtName").val();
        chrome.storage.local.set({ 'name': v }, function () {
            alert('Settings saved');
        });
        return false;
    });
});