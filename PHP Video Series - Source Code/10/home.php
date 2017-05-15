<?php
	session_start(); // Starting Session
?>

<?php
	if(isset($_SESSION["user"])==false)
	{
		header('Location:login.php');
	}
?>
<html>
<head>
</head>
<body>

<h1> Purpose: How to Handle Click Events </h1>
<p> Whenever form is posted from client to server, all the 
form elements come to server in <b>key-value pair dictionary</b>.
If a button is clicked, it also comes to server. </p>

<h1>Welcome <?php echo $_SESSION["user"]; ?>

</body>
</html>