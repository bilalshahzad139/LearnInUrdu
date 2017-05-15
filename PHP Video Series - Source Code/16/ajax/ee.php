<html>
<head>
<script src="jquery-3.1.1.min.js" type="text/javascript"></script>
<style>
	.files{
		background-color:lightgrey;
		padding:5px;
		margin:5px;
	}
	.file{
		padding:5px;
	}
	.fileName,.fileSize,.delete{
		margin-right:5px;
		background-color:grey;
		
	}
	.fileImg{
		margin-right:10px;
		width:20px;
		height:20px;
	}
</style>
<script>

	function ReadAndDisplay(img,file){
		var reader = new FileReader();
		reader.onload = function(e) {
			
			//var img = $("<img>").css({"width":200,"height":200});
			img.attr("src",e.target.result);
			//var d = $("<div>");
			//d.append(img);
			//$(".container").append(d);
		}
		reader.readAsDataURL(file);
	}
	$(function(){
		$("#btnLoad").click(function(){
			$("#myfile").click();
		});
		$("#myfile").change(function(){
			var files = $("#myfile").get(0).files;
			if(files.length > 0)
			{
				for(var ind=0;ind<files.length;ind++)
				{
					var file = files[ind];
					
					console.log(file);											
					
					var $div = $("<div>").addClass("file");
					
					var $img = $("<img>").addClass("fileImg");
					$div.append($img);
					
					var $span = $("<span>").addClass("fileName").text(file["name"]);
					$div.append($span);
					
					$span = $("<span>").addClass("fileSize").text(file["size"] + " Bytes");
					$div.append($span);
					
					var link = $("<a>").attr("href","#").addClass("delete").text("X");
					$div.append(link);
					
					$(".files").append($div);
					
					ReadAndDisplay($img,file);
				}	
			}		
		});	//end of change event	
	});
</script>

</head>
<body>

Picture: <input type="button" id="btnLoad" value="Upload" />
<input type="file" id="myfile" multiple style="display:none" />
<div class="files"></div>
<div class="container"></div>

</body>
</html>