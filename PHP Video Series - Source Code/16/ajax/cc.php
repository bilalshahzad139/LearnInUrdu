<html>
<head>
<script src="jquery-3.1.1.min.js" type="text/javascript"></script>

<script>
	$(function(){
		$("#btnUpload").click(function(){
			
			var data = new FormData();			
			
			var files = $("#myfile").get(0).files;
			if(files.length > 0)
			{
				for(var ind=0;ind<files.length;ind++)
				{
					console.log(files[ind]);					
					data.append("myfile-"+ind,files[ind]);			
				}
				
				data.append("FileCount",files.length);			
			}
			
			data.append("Age",$("#txtAge").val());
			data.append("Action", "SaveAll");
			
			var settings = {
				type:"POST",
				url:"api.php",
				contentType:false,
				processData:false,
				data:data,
				success:function(r){
					alert(r);
				},
				error:function(){
					alert('error has occurred');
				}					
			};
				
			$.ajax(settings);
				
			
			return false;
		});
	});
</script>

</head>
<body>

Age:<input type="text" id="txtAge" /> <br>
Picture: <input type="file" id="myfile" multiple />
<input type="button" id="btnUpload" value="Send" />


</body>
</html>