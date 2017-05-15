<?php include("utility.php");?>


<html>
<head>
</head>
<body>

<?php 
//http://php.net/manual/en/features.file-upload.multiple.php

	if(isset($_REQUEST["btnUpload"])==true){
		$age = $_REQUEST["txtAge"];
		$files = $_FILES["myfile"];
		
		$file_count = count($files['name']);
		
		for($ind=0;$ind<$file_count;$ind++){
		
			$src_path = $files["tmp_name"][$ind];
			$name = $files["name"][$ind];
			$new_name = SaveFile($src_path,$name);
			echo "Saved:New Name:".$new_name;
			echo "<br>";
		}
	}
?>

<form action="" method="post" enctype="multipart/form-data">

	Age:<input type="text" id="txtAge" name="txtAge" /> <br>
	Picture: <input type="file" id="myfile" name="myfile[]" multiple />
	<input type="submit" id="btnUpload" name="btnUpload" value="Send" />

</form>
</body>
</html>