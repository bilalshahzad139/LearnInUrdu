<html>
<head>
</head>
<body>

<?php 
	if(isset($_REQUEST["btnUpload"])==true){
		$age = $_REQUEST["txtAge"];
		$file = $_FILES["myfile"];
		
		echo $age;
		echo "<br>";
		print_r($file);
		echo "<br>";
		echo "name:".$file["name"]."<br>";
		echo "type:".$file["type"]."<br>";
		echo "tmp_name:".$file["tmp_name"]."<br>";
		echo "error:".$file["error"]."<br>";
		echo "size:".$file["size"]."<br>";
		
	}
?>


<form action="" method="post" enctype="multipart/form-data">

	Age:<input type="text" id="txtAge" name="txtAge" /> <br>
	Picture: <input type="file" id="myfile" name="myfile" />
	<input type="submit" id="btnUpload" name="btnUpload" value="Send" />

</form>


</body>
</html>