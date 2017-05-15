<?php require('conn.php'); ?>

<?php
session_start(); // Starting Session

if(isset($_SESSION["user"]) == false){	
	header('Location: login.php');
}

?>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type ="text/css" href="style.css" >

<script src="jquery.js"></script>

<script>
	$(document).ready(function(){
		
		$("#btnUpdate").click(function(){
		
			var userid = $("#userid").val();
			var name = $("#txtNewUserName").val();
			var login = $("#txtLogin2").val();
			var password = $("#txtPassword1").val();
			
			//object to pass as parameter
			var data = {"action": "updateuser","id":userid,"name":name,"login":login,"password":password};
			
			//object pass to $.ajax function to make an AJAX call.
		
			var settings= {
				type: "POST",
				dataType: "json",
				url: "api.php",
				data: data,
				success: function(response) {
					//response.data contains whatever is sent from server
					if(response.data == true){
						alert("Record is updated");
						window.location.href = "home.php";
					}
					else {
						alert("unable to update");
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
	if(isset($_REQUEST["userid"])){
		
		$userid = $_REQUEST["userid"];
		$sql = "SELECT * FROM users where id='$userid'";
		
	   $result = mysqli_query($conn, $sql);	   
	   $recordsFound = mysqli_num_rows($result);
		  
	   if($recordsFound == 1)
	   {
			$row = mysqli_fetch_assoc($result); 				 
			print_r($row);
	   }
	   else {
		 header('Location: home.php');
	   }
	}	

?>

  
  <div class="registration">
		
	  <h1> Update Profile </h1>
	   <input type="hidden" value="<?php echo $row['id']; ?>" id="userid" />
	   User Name: <input type="text" name="txtNewUserName" id='txtNewUserName' value="<?php echo $row['name']; ?>"  /> <br>
	   Login: <input type="text" name="txtLogin2" id="txtLogin2" value="<?php echo $row['login']; ?>"  /> <br>
	   Password: <input type="password" name="txtPassword1" id="txtPassword1" value=""/> <br>
	   Confirm Password: <input type="password" name="txtPassword2" value="" /><br>	   
		
		<input type="submit" name="btnUpdate" id="btnUpdate" value="Update" /><br>
		<span style='color:red'><?php echo $msg ?></span>
  </div>
	
</form>




</body>
</html>