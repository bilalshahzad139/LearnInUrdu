<html>
<head>
</head>
<body>

<?php 

//http://php.net/manual/en/features.file-upload.multiple.php


	if(isset($_REQUEST["btnUpload"])==true){
		$age = $_REQUEST["txtAge"];
		$file = $_FILES["myfile"];
		
		print_r($file);
		
		echo "<br>";		
		print_r($file["name"]);
		
		echo "<br>";		
		print_r($file["type"]);
		
		echo "<br>";		
		print_r($file["tmp_name"]);
		
		echo "<br>";		
		print_r($file["size"]);
		
	}
?>


<form action="" method="post" enctype="multipart/form-data">

	Age:<input type="text" id="txtAge" name="txtAge" /> <br>
	Picture: <input type="file" id="myfile" name="myfile[]" multiple />
	<input type="submit" id="btnUpload" name="btnUpload" value="Send" />

</form>


</body>
</html>