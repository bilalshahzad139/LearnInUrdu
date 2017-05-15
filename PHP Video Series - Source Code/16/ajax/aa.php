<html>
<head>
<script src="jquery-3.1.1.min.js" type="text/javascript"></script>

<script>
	$(function(){
		$("#btnUpload").click(function(){
					
			var files = $("#myfile").get(0).files;
			if(files.length > 0)
			{
				console.log(files[0]);
			}
				
			return false;
		});
	});
</script>

</head>
<body>

Age:<input type="text" id="txtAge" /> <br>
Picture: <input type="file" id="myfile" />
<input type="button" id="btnUpload" value="Send" />






</body>
</html>