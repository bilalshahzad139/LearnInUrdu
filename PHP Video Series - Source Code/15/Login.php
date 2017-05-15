<?php require('conn.php'); ?>

<?php
session_start(); // Starting Session
?>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type ="text/css" href="style.css" >

<script src="jquery.js"></script>

<script>
	$(document).ready(function(){
		
		$("#country").change(function(){
		
			$("#city option:not(:first)").remove();
		
			var countryid = $(this).val();
			if(countryid <= 0 )
				return;
			
			
			//object to pass as parameter
			var data = {"action": "getcities",'countryid':countryid};
			
			//object pass to $.ajax function to make an AJAX call.
		
			var settings= {
				type: "POST",
				dataType: "json",
				url: "api.php",
				data: data,
				success: function(response) {
					//response.data contains whatever is sent from server
					
					for(var i=0;i<response.data.length;i++){
						var obj = response.data[i];
						var opt = $("<option>").attr("value",obj.id).text(obj.cityname);
						$("#city").append(opt);
					}
					
				},
				error: function (err, type, httpStatus) {
					alert('error has occured');
				}
			};
			
			$.ajax(settings);
			console.log('request sent');
			return false;			
		});//end of change 
		
	});//end of ready
</script>


</head>
<body>

<?php
	$error = "";
	$uname = "";
	$msg = "";
	if(isset($_REQUEST["btnSubmit"])){
		
		$uname = $_REQUEST["txtLogin1"];
		$pswd = $_REQUEST["txtPassword"];
		
		$sql = "SELECT * FROM users where login='$uname' and password='$pswd'";
		
	   $result = mysqli_query($conn, $sql);
	   
	   $recordsFound = mysqli_num_rows($result);
		  
	   if($recordsFound == 1)
	   {
		   $row = mysqli_fetch_assoc($result); 
		 $_SESSION['user']=$uname;
		 $_SESSION["userid"] = $row["id"];
		 header('Location: home.php');
	   }
	   else {
		 $error =  "Invalid User Name/Password";
	   }
	   
		
	}
	else if(isset($_REQUEST["btnRegister"])){
	
		$name = $_REQUEST["txtNewUserName"];
		$login = $_REQUEST["txtLogin2"];
		$password = $_REQUEST["txtPassword1"];		
		$city = $_REQUEST["city"];
		
		
		$sql = "INSERT INTO users (name, login,password,cityid)
			VALUES ('$name', '$login', '$password','$city')";
		
		if (mysqli_query($conn, $sql) === TRUE) {
			$last_id = mysqli_insert_id($conn);
			$msg = "You are registered successfully.";
		} else {
			//$msg = "Error: " . $sql . "<br>" . mysqli_error($conn);
			$msg = "Some Problem has occurred";
		}
	
	}

?>



<form action="Login.php" method="POST" >
  
  <div class="loginpanel">
	  <h1> Login Screen </h1>
	   User Name: <input type="text" name="txtLogin1" value="" /> <br>
	   Password: <input type="password" name="txtPassword" /><br>
	   <input type="submit" name="btnSubmit" value="Login" /><br>	   
	   <span style='color:red'><?php echo $error; ?></span>
  </div>
	
  
  <div class="registration">
		
	  <h1> New User? </h1>
	   User Name: <input type="text" name="txtNewUserName" value=""  /> <br>
	   Login: <input type="text" name="txtLogin2" value=""  /> <br>
	   Password: <input type="password" name="txtPassword1" value=""/> <br>
	   Confirm Password: <input type="password" name="txtPassword2" value="" /><br>
	   Country: <select name="country" id="country">
				<option value="0">--Select--</option>				
				<?php 
				
				$sql = "SELECT id,name FROM country";
				$result = mysqli_query($conn, $sql);
				$recordsFound = mysqli_num_rows($result);			
				if ($recordsFound > 0) {
					while($row = mysqli_fetch_assoc($result)) {
					
						$id = $row["id"];
						$name = $row["name"];
						echo "<option value='$id'>$name</option>";
					}
				}				
				?>
			  </select><br>
	   City: <select name="city" id="city">
				<option value="0">--Select--</option>				
			 </select><br>
		
		<input type="submit" name="btnRegister" value="Register" /><br>
		<span style='color:red'><?php echo $msg ?></span>
  </div>
	
</form>




</body>
</html>