<?php
$h = "Hello World";
$v = "20";
$a = false;
?>

<html>
<head>
 <style>
	 .error{
		 color:red;
	 }
 </style>
</head>
<body>
 
 <h1><?php echo $h ?> </h1>
    
  <input type="text" value="<?php echo $v ?>" />
  
  <?php if($a == true){ ?>
	<span class="error">Something is missing </span>
  <?php } ?>

</body>

</html>