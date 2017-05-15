<html>
<head>
</head>
<body>

<h1> Purpose: How to Handle Click Events and get form data </h1>
<p> Whenever form is posted from client to server, all the 
form elements come to server in <b>key-value pair dictionary</b>.
If a button is clicked, it also comes to server. </p>

<?php
   
  /*When a form is posted to server, all the key-value pairs
  are available in three variables in PHP (server side programming)
   -> $_GET this contains data if "GET" method is used while posting
   -> $_POST this contains data if "POST" method is used while posting
   -> $_REQUEST this contains data whether data is posted by "GET" or "POST"
 */
 
  //How to check if button is clicked or page is opening for first time
 //print_r($_REQUEST);
 $error = "";
 $uname = "";
 
 if(isset($_REQUEST["btnSubmit"]) == true)
 {
   echo "button is pressed <br>";
   
   $uname = $_REQUEST["txtUserName"];   
   $pswd = $_REQUEST["txtPassword"];
   
   echo "User Name: $uname <br>";
   echo "Password: $pswd <br>";
 }
 

?>

<form action="8b.php" method="GET" >
   User Name: <input type="text" name="txtUserName"   />   
	
   <br>
   Password: <input type="password" name="txtPassword" /><br>
   <input type="submit" name="btnSubmit" value="Login" />
   <input type="submit" name="btnRegister" value="Register" />
   
</form>
	
	

</body>
</html>