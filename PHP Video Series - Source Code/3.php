<html>
<head>
</head>
<body>

    <?php
		
		echo "<h1>For Loop </h1>";
		
		for($a=0;$a<5;$a++){
			echo "Value is: ". $a;
		}
		
		echo "<h1>While Loop </h1>";
		$a = 0;
		while($a <10){
			echo "Value is: ". $a;
			$a++;
		}
		
		echo "<h1>Do-While Loop </h1>";
		$a = 0;
		do{
			echo "Value is: ". $a;
			$a++;
		}while($a<10);
		
		echo "<h1> if-else </h1>";
		
		$a = 20;
		$b = 30;
		
		if($a > $b)
			echo $a."is greater";
		else 
			echo $a."is not greater";
		
		
    ?>
    
    
<h1> Testing </h1>
</body>

</html>