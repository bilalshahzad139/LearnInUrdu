<?php
  if (isset($_REQUEST["action"]) && !empty($_REQUEST["action"])) 
  { 
    $action = $_REQUEST["action"];
	
    if($action == "task1")
	{		
		//return String		
		echo json_encode("Pakistan");
	}
	else if($action == "task2")
	{
		//return String
		echo json_encode(23);
	}
	else if($action == "task3")
	{
		$arr = array ('name'=>'bilal',
					  'city'=>'Lahore',
					  'age'=>100);
		
		echo json_encode($arr);
	}
	else if($action == "task4")
	{
		$countries = array();
		$countries[0] = array("ID"=>1,"Name"=>"Pakistan");
		$countries[1] = array("ID"=>2,"Name"=>"India");
		$countries[2] = array("ID"=>3,"Name"=>"China");
	
		$output["data"] = $countries;
		echo json_encode($output);
	}
	else if($action == "task5")
	{
		$name = $_REQUEST["Name"];
		$city = $_REQUEST["City"];
	
		$output["data"] = true;
		$output["name"] = $name;
		echo json_encode($output);
	}
  }//end of if
  


?>