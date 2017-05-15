<?php
session_start(); // Starting Session
?>

<html>
<head>
<title>Logout</title>
<link rel="stylesheet" type ="text/css" href="style.css" >
</head>
<body>

<?php

$_SESSION["user"] = null;
 
?>


<h1> User is Logged Out Now </h1>

<a href='Login.php'>Click Here to Login </a>

</body>
</html>