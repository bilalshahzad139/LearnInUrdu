var MyApp = {};

MyApp = (function () {


    function Clear() {
        $("#txtProductID").val(0);
        $("#txtPictureName").val("");
        $("#txtName").val("");
        $("#txtPrice").val("");
        $("#prodimg").hide();
    }
    function SaveProduct() {

        var data = new FormData();

        var id = $("#txtProductID").val();
        var name = $("#txtName").val();
        var price = $("#txtPrice").val();
        var oldPicName = $("#txtPictureName").val();

        data.append("ProductID", id);
        data.append("Name", name);
        data.append("Price", price);
        data.append("PictureName", oldPicName);


        var files = $("#myfile").get(0).files;
        if (files.length > 0) {
            data.append("Image", files[0]);
        }

        var settings = {
            type: "POST",
            url: window.BasePath + 'Product2/Save',
            contentType: false,
            processData: false,
            data: data,
            success: function (r) {
                console.log(r);

                var obj = {};
                obj.data = [];
                obj.data.push({ ProductID: r.ProductID, Name: name, Price: price, PictureName: r.PictureName });

                var source = $("#listtemplate").html();
                var template = Handlebars.compile(source);

                var html = template(obj);

                if (id > 0) {
                    $("#tblBody tr[pid=" + id + "]").replaceWith(html);
                }
                else {
                    $("#tblBody").prepend(html);
                }

                BindEvents();

                Clear();

                alert("record is saved");
            },
            error: function () {
                alert('error has occurred');
            }
        };

        $.ajax(settings);
    }
    function LoadProducts() {


        MyAppGlobal.MakeAjaxCall("GET", 'Product2/GetAllProducts',{}, function (resp) {

            if (resp.data) {
                var source = $("#listtemplate").html();
                var template = Handlebars.compile(source);

                var html = template(resp);
                $("#tblBody").append(html);

                BindEvents();

            }
        });
                       
    }
    function BindEvents() {

        $(".editprod").unbind("click").bind("click", function () {
            var $tr = $(this).closest("tr");
            var pid = $tr.attr("pid");

            var d = { "pid": pid };

            MyAppGlobal.MakeAjaxCall("GET", 'Product2/GetProductById', d, function (resp) {
                $("#txtProductID").val(resp.data.ProductID);
                $("#txtPictureName").val(resp.data.PictureName);
                $("#txtName").val(resp.data.Name);
                $("#txtPrice").val(resp.data.Price);
                $("#prodimg").show().attr("src", window.BasePath + "UploadedFiles/" + resp.data.PictureName);
                
            });

            return false;
        });

        $(".deleteprod").unbind("click").bind("click", function () {

            if (!confirm("Do you want to continue?")) {
                return;
            }
            var $tr = $(this).closest("tr");
            var pid = $tr.attr("pid");

            var d = { "pid": pid };

            MyAppGlobal.MakeAjaxCall("POST", 'Product2/DeleteProduct', d, function (resp) {
                
                $tr.remove();
            });
            

            return false;
        });

        $(".emailprod").unbind("click").bind("click", function () {
            var $tr = $(this).closest("tr");
            var pid = $tr.attr("pid");

            var d = { "pid": pid };

            MyAppGlobal.MakeAjaxCall("GET", 'Product2/GetProductById', d, function (resp) {

                $("#popupname").text(resp.data.Name);

                $("#overlay").show();

                $("#emailpopup").show();

            });

            return false;
        });
    }


    return {
        Main: function () {

            LoadProducts();

            $("#btnSave").click(function () {

                SaveProduct();
                return false;
            });

            $("#btnClear").click(function () {

                Clear();
                return false;
            });

            $("#btnSend").click(function () {
                //Call send email function
                $("#emailpopup").hide();
                $("#overlay").hide();
                return false;
            });
            $("#btnClose").click(function () {
                $("#emailpopup").hide();
                $("#overlay").hide();
                return false;
            });
        }
    };

})();