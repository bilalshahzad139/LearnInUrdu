<html>
<head>
</head>
<body>

    <?php

		$numbers = array( 1, 2, 3, 4, 5, true,"Pakistan");
         
		 echo "<h1>By for loop </h1>";
		 for($a=0;$a<count($numbers);$a++)
		 {
			 echo "Value is: ". $numbers[$a]. "<br>";			 
		 }	 
		 
		 echo "<h1>By foreach loop </h1>";
		 //Iterate your array
         foreach( $numbers as $value ) {
			echo "Value is ".$value." <br />";            
         }
         
         /* Second method to create array. */
         $numbers[0] = "one";
         $numbers[1] = "two";
         $numbers[2] = "three";
         $numbers[3] = "four";
         $numbers[4] = "five";
         
         foreach( $numbers as $value ) {
            echo "Value is $value <br />";
         }
		
		echo "Associative Arrays Example <br>";
		//Associative Arrays
		
		$salaries = array("MCSf1" => 2000, "MCSf2" => 1000, "MCSf3" => 500);
		
		//Print values
		foreach($salaries as $salary){
			echo "Salary is $salary <br>";
		}
		
		echo "Salary of MCSf1 is ". $salaries["MCSf1"]. "<br>";
		echo "Salary of MCSf2 is ". $salaries["MCSf2"]. "<br>";
		echo "Salary of MCSf3 is ". $salaries["MCSf3"]. "<br>";
		
		
		//Multidimensional Arrays
		
		$array = array("d1"=> array("id"=>1,"Name"=>"Bilal1"),
						"d2"=> array("id"=>2,"Name"=>"Bilal2"));
		
		
		foreach($array as $item){
			echo "ID is: ". $item["id"]. " and Name is:". $item["Name"] ."<br>";
		}
		
		
		print_r($array);
		//var_dump($array);
		
		
    ?>
    
    
<h1> Testing </h1>
</body>

</html>