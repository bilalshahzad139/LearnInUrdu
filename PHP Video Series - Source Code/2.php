<html>
<head>
</head>
<body>

    <?php

		$a = 20;
		$b = "Hello World";
		
		//. is use to concat
		echo("using echo: Value of a is".$a); 
		echo "<br>";
		
		print("using print: Value of a is".$a);
		print "<br>";
		
		print_r("using print_r: Value of a is".$a);
		echo "<br>";
		
		var_dump($a);
		echo "<br>";
		
		var_dump("Pakistan");
		echo "<br>";
		
		
		//$s = null;
		$s = "";
		
		if(isset($s) == true)
			echo "Value is not null <br>";
		else 
			echo "Value is null <br>";
		
		if(empty($s) == true)
		{
			echo "Value is empty string <br>";
		}
		
		//Single Line Commenting
		
		/*
		Multiline Commenting
		*/
		
    ?>
    
    
<h1> Testing </h1>
</body>

</html>