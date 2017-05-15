<html>
<head>
</head>
<body>

    <?php
	class Student {
		function Student() {
			$this->ID = "0";
			$this->Name = "";
		}
	}

	// create an object
	$std = new Student();

	$std->ID = 1;
	$std->Name = "Bilal";
	
	echo "ID is: ". $std->ID;
	echo "<br>";
	

	print_r($std);
	
	?>
    
    
<h1> Testing </h1>
</body>

</html>