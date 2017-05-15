
<html>
<head>

<script src="jquery.js"></script>

<script>
	$(document).ready(function(){
		
		$("#btnShow").click(function(){
		
			var dataToSend = {"action": "task5","Name":"Bilal","City":"Lahore"};
			
			var settings= {
				type: "POST",
				dataType: "json",
				url: "api.php",
				data: dataToSend,
				success: Mysucfunction,
				error: OnError
			};
			
			$.ajax(settings);
			console.log('request sent');
			return false;			
		});//end of show all
		
		function Mysucfunction(r) {
				console.log(r);					
		}
		function OnError(){
			alert('error has occured');
		}
	});//end of ready
</script>
</head>
<body>

<h1> Simple AJAX Example 1 </h1>
   
   <input type="submit" id="btnShow" value="Show" />
   
</body>
</html>