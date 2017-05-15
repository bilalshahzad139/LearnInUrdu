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
<style>
	.box {
	 padding:5px;
	 border: solid 1px red;
	 wdith:200px;
	 float:left;
	 margin: 5px;
	}
</style>
</head>
<body>

<form method="POST">
	<input type="submit" name="btnSumit" value="Show All" />
</form>

 
<div>
<?php

		if(isset($_REQUEST["btnSumit"]) == true)
		{
		$sql = "SELECT id,name,city,age FROM student";
		$result = mysqli_query($conn, $sql);

		$recordsFound = mysqli_num_rows($result);
		
		if ($recordsFound > 0) {
		
			echo $recordsFound." Records are found! <br>";
			
			while($row = mysqli_fetch_assoc($result)) {
				
				$id = $row["id"];
				$name = $row["name"];
				$city = $row["city"];
				$age = $row["age"];
				
				echo "<div class='box'>";
				echo "ID:$id <br>";
				echo "Name:<a href='edit.php?id=$id'>$name</a><br>";
				echo "City:$city<br>";
				echo "Age:$age";
				echo "</div>";
			}				
		} 
		else {
			echo "0 results";
		}
		
		}
?>
</div>




</body>
</html>

<?php 
//Close the connection
$conn->close();

?>