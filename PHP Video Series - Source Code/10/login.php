<?php
	session_start(); // Starting Session
?>

<html>
<head>
	<script src="jquery.js"  > </script>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			$("#btnSubmit").click(function(){
				
				var u = $("#txtUserName").val();
				var p = $("#txtPassword").val();
				var flag = true;
				
				if(u == ""){
					flag = false;
					alert("User Name is mandatory!");
				}
				if(p == ""){
					flag = false;
					alert("Password is mandatory!");
				}
				return flag;
			});
		});
	</script>
</head>
<body>

<h1> Login Screen </h1>
<?php 
	$error = "";
	if(isset($_REQUEST["btnSubmit"])){
		$u = $_REQUEST["txtUserName"];
		$p = $_REQUEST["txtPassword"];
		
		if($u == "admin" && $p == "admin"){
			$_SESSION["user"] = $u;
			header('Location: home.php');
		}
		else{
			$_SESSION["user"] = null;
			$error ="Invalid credentials";
		}
	}	
?>

<form action="login.php" method="POST" >
  
   User Name: <input type="text" id="txtUserName" name="txtUserName" /> <br>
   Password: <input type="password" id="txtPassword" name="txtPassword" /><br>
   <input type="submit" name="btnSubmit" id="btnSubmit" value="Login" />
	<br>
	<span><?php echo $error; ?></span>
	
</form>
</body>
</html>