<?php 

	$countries = array();
	$countries[0] = array("ID"=>1,"Name"=>"Pakistan");
	$countries[1] = array("ID"=>2,"Name"=>"India");
	$countries[2] = array("ID"=>3,"Name"=>"China");

?>
<html>
<head>
</head>
<body>

   <form action="9b.php" method="post" >
  
	   User Name: <input type="text" name="txtUserName" /> <br>
	   Password: <input type="password" name="txtPassword" /><br>
	   
	   <select name="country">
	   <option value="0">--Select--</option>
	   <?php 
		foreach($countries as $c){
			echo "<option value='".$c["ID"]."'>".$c["Name"]."</option>";
		}
	   ?>
	   </select>
	   <br>
	   
	   <input type="submit" name="btnSubmit" value="Login" />
   </form>

</body>
</html>