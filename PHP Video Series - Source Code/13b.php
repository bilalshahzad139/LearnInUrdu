 <?php
		$servername = "localhost";
		$username = "root";
		$password = "";
		$dbname = "test";
		// Create connection
		$conn = mysqli_connect($servername, $username, $password,$dbname);

		// Check connection
		if (!$conn) {
			die("Connection failed: " . mysqli_connect_error());
		}
		echo "Connected successfully";		
?>

<html>
<head>
</head>
<body>
 
<?php

		if(isset($_REQUEST["btnSumit"]) == true)
		{
			$name = "Bilal5";
			$city = "Karachi";
			$age = 45;
			
			$sql = "INSERT INTO student (name, city, age)
				VALUES ('$name', '$city', '$age')";
			
			if (mysqli_query($conn, $sql) === TRUE) {
				$last_id = mysqli_insert_id($conn);
				echo "New Id is:".$last_id;
			} else {
				echo "Error: ". mysqli_error($conn);
			}
		}
?>

<form method="POST">
	<input type="submit" name="btnSumit" value="Add" />
</form>

</body>
</html>

<?php 
//Close the connection
$conn->close();

?>