<?php
session_start(); // Starting Session

if(isset($_SESSION["user"]) == false){	
	header('Location: login.php');
}

?>

<html>
<head>
<title>Home Screen</title>
<link rel="stylesheet" type ="text/css" href="style.css" >
</head>
<body>

<h1>Welcome <?php echo $_SESSION["user"];?></h1>

<a href='edit.php?userid=<?php echo $_SESSION["userid"];?>'>Click here to edit your profile </a> <br>
<a href='Logout.php'>Click here to Logout</a>

</body>
</html>