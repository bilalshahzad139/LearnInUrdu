
var MyAppGlobal = {};

MyAppGlobal = (function () {

    return {
        MakeAjaxCall: function (httpmethod, url, data, successFun, errorFunc) {

            var settings = {
                type: httpmethod,
                dataType: "json",
                url: window.BasePath + url,
                data: data,
                success: function (resp) {
                    console.log(resp);

                    try {
                        if (successFun) {
                            successFun(resp)
                        }
                    } catch (e) {

                    }
                },
                error: function (e) {
                    if (errorFunc) {
                        errorFunc();
                    }
                    else {
                        alert("some error has occurred");
                    }
                }
            };

            $.ajax(settings);
        }
    };

})();