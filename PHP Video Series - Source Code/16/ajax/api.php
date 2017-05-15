<?php include("utility.php");?>

<?php 
	
	if(isset($_REQUEST["Action"]) && !empty($_REQUEST["Action"])){
		
		
		$action = $_REQUEST["Action"];	
		if($action == "Save"){		
		
			$age = $_REQUEST["Age"];			
			
			if(isset($_FILES["myfile"])==true){
				
				$file = $_FILES["myfile"];
				
				$src_path = $file["tmp_name"];
				$name = $file["name"];
				
				SaveFile($src_path,$name);
				echo true;
			}		
		}
		else if($action == "SaveAll"){		
		
			$age = $_REQUEST["Age"];			
			
			if(isset($_REQUEST["FileCount"])==true){
				$count = $_REQUEST["FileCount"];
				
				for($ind=0;$ind<$count;$ind++){
				
					$file = $_FILES["myfile-".$ind];
				
					$src_path = $file["tmp_name"];
					$name = $file["name"];
				
					SaveFile($src_path,$name);
				}
				
				
				echo true;
			}		
		}
	}
	

?>