<html>
<head>
<script src="jquery-3.1.1.min.js" type="text/javascript"></script>

<script>
	$(function(){
		$("#myfile").change(function(){
			var files = $("#myfile").get(0).files;
			if(files.length > 0)
			{
				for(var ind=0;ind<files.length;ind++)
				{
					console.log(files[ind]);											
					
					var reader = new FileReader();
					reader.onload = function(e) {
						debugger;
						var img = $("<img>").css({"width":200,"height":200});
						img.attr("src",e.target.result);
						var d = $("<div>");
						d.append(img);
						$(".container").append(d);
					}
					reader.readAsDataURL(files[ind]);
					
				}	
			}		
		});	//end of change event	
	});
</script>

</head>
<body>

Picture: <input type="file" id="myfile" multiple />
<div class="container">
</div>

</body>
</html>