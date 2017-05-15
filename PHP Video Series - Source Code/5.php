<html>
<head>
</head>
<body>

    <?php
	
	function Sum($a,$b){
		
		$numargs = func_num_args();
		$argument = func_get_args();
		
		print_r($numargs);
		print "<br>";
		print_r($argument);
		print "<br>";
		
		return $a + $b;		
	}
	
	function Test($type){
		if($type == 1)
			return "Hello World";
		else if($type == 2)
			return 25;
		else if($type == 3)
			return array(1,2,3);
	}
	
	
		$result = Sum(5,10,15);
		echo "Sum is: $result <br>";
		
		echo "<h1> Test function usage </h1><br>";
		
		$result = Test(1);
		echo "Result of Type 1 is $result <br>";
		
		$result = Test(2);
		echo "Result of Type 2 is $result <br>";
		
		$result = Test(3);
		print_r ($result);
		
    ?>
    
    
<h1> Testing </h1>
</body>

</html>