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
            url: window.BasePath + '/Product2/Save',
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

        var settings = {
            type: "GET",
            dataType: "json",
            url: "/Product2/GetAllProducts",
            data: {},
            success: function (resp) {
                console.log(resp);

                if (resp.data) {
                    var source = $("#listtemplate").html();
                    var template = Handlebars.compile(source);

                    var html = template(resp);
                    $("#tblBody").append(html);

                    BindEvents();

                }
            },
            error: function (e) {
                alert("error");
            }
        };

        $.ajax(settings);
    }
    function BindEvents() {

        $(".editprod").unbind("click").bind("click", function () {
            var $tr = $(this).closest("tr");
            var pid = $tr.attr("pid");

            var d = { "pid": pid };

            var settings = {
                type: "GET",
                dataType: "json",
                url: "/Product2/GetProductById",
                data: d,
                success: function (resp) {
                    //Load values in fields
                    console.log(resp);
                    $("#txtProductID").val(resp.data.ProductID);
                    $("#txtPictureName").val(resp.data.PictureName);
                    $("#txtName").val(resp.data.Name);
                    $("#txtPrice").val(resp.data.Price);
                    $("#prodimg").show().attr("src", "/UploadedFiles/" + resp.data.PictureName);

                },
                error: function (e) {
                    alert("error");
                }
            };

            $.ajax(settings);

            return false;
        });

        $(".deleteprod").unbind("click").bind("click", function () {

            if (!confirm("Do you want to continue?")) {
                return;
            }
            var $tr = $(this).closest("tr");
            var pid = $tr.attr("pid");

            var d = { "pid": pid };

            var settings = {
                type: "POST",
                dataType: "json",
                url: "/Product2/DeleteProduct",
                data: d,
                success: function (resp) {
                    $tr.remove();
                },
                error: function (e) {
                    alert("error");
                }
            };

            $.ajax(settings);

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
        }
    };

})();