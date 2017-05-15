<html>
<head>
</head>
<body>

<?php 
	if(isset($_REQUEST["btnUpload"])==true){
		$age = $_REQUEST["txtAge"];
		$file = $_FILES["myfile"];
		
		$src_path = $file["tmp_name"];
		$des_path = "img//".$file["name"];
		
		//Move file from one location to other location
		move_uploaded_file($src_path,$des_path);
	}
?>


<form action="" method="post" enctype="multipart/form-data">

	Age:<input type="text" id="txtAge" name="txtAge" /> <br>
	Picture: <input type="file" id="myfile" name="myfile" />
	<input type="submit" id="btnUpload" name="btnUpload" value="Send" />

</form>


</body>
</html>