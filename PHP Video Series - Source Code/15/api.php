<?php require('conn.php'); ?>

<?php
  if (isset($_REQUEST["action"]) && !empty($_REQUEST["action"])) 
  { 
    $action = $_REQUEST["action"];
	
    if($action == "getcities")
	{
		$countryid = $_REQUEST["countryid"];
		$sql = "SELECT id,cityname FROM city where countryid=$countryid";
		
		$result = mysqli_query($conn, $sql);
		$recordsFound = mysqli_num_rows($result);			
		$results = array();
		if ($recordsFound > 0) {
			while($row = mysqli_fetch_assoc($result)) {			
				$results[] = $row;				
			}
		}
		
		$output["data"] = $results;
		echo json_encode($output);
	}
	else if($action == "updateuser")
	{
		$id = $_REQUEST["id"];
		$name = $_REQUEST["name"];
		$login = $_REQUEST["login"];
		$password = $_REQUEST["password"];
		
		$sql = "Update users SET name='$name', login='$login',password='$password' where id='$id')";
		
		$flag = false;
		if (mysqli_query($conn, $sql) === TRUE) {			
			$flag = true;
		} else {
			//$msg = "Error: " . $sql . "<br>" . mysqli_error($conn);
			$flag = false;
		}
		$output["data"] = $flag;
		echo json_encode($output);
	}
	
  }//end of if
  


?>