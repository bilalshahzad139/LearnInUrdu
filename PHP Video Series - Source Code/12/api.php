<?php
  if (isset($_REQUEST["action"]) && !empty($_REQUEST["action"])) 
  { 
    $action = $_REQUEST["action"];
	
    if($action == "save")
	{	
		//Get data from Request
		$name = $_REQUEST["name"];
		$city = $_REQUEST["city"];
		$age = $_REQUEST["age"];
		
		//return some response	
		echo json_encode(true);
	}
	
	else if($action == "showall")
	{
		$students = array();
		$students[0] = array("ID"=>1,"Name"=>"Bilal1","City"=>"Lahore","Age"=>45);
		$students[1] = array("ID"=>2,"Name"=>"Bilal2","City"=>"Lahore","Age"=>45);
		$students[2] = array("ID"=>3,"Name"=>"Bilal3","City"=>"Lahore","Age"=>45);
	
		$output["data"] = $students;
		echo json_encode($output);
	}
	
  }//end of if
  


?>