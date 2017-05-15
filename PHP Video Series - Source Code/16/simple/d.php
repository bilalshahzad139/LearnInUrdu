<?php
function GUID()
{
    if (function_exists('com_create_guid') === true)
    {
        return trim(com_create_guid(), '{}');
    }

    return sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
}
function SaveFile($src_path,$name){
		
		//Generate a new unique name
		$new_name = GUID(); 
		echo "New name:".$new_name;
		echo "<br>";
		
		//Now get extension of file
		$tempArr = explode(".", $name);//split name by .
		
		print_r($tempArr);
		echo "<br>";
		
		$ext = end($tempArr); //Get last value from here which is extension
		
		echo "Extension:".$ext;
		echo "<br>";
		
		$full_new_name = $new_name.".".$ext;
		
		$des_path = "img//".$full_new_name;
		
		//Move file from one location to other location
		move_uploaded_file($src_path,$des_path);
}
?>

<html>
<head>
</head>
<body>

<?php 
	if(isset($_REQUEST["btnUpload"])==true){
		$age = $_REQUEST["txtAge"];
		$file = $_FILES["myfile"];
		
		$src_path = $file["tmp_name"];
		$name = $file["name"];
		SaveFile($src_path,$name);
		
	}
?>


<form action="" method="post" enctype="multipart/form-data">

	Age:<input type="text" id="txtAge" name="txtAge" /> <br>
	Picture: <input type="file" id="myfile" name="myfile" />
	<input type="submit" id="btnUpload" name="btnUpload" value="Send" />

</form>


</body>
</html>