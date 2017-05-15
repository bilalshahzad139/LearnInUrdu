
<html>
<head>

<style>
.box {
 padding:5px;
 border: solid 1px red;
 wdith:200px;
 float:left;
 margin: 5px;
}
</style>

<script src="jquery.js"></script>

<script>
	$(document).ready(function(){
		
		$("#btnSave").click(function(){
		
			var n = $("#txtName").val();
			var c = $("#cmbCity").val();
			var a = $("#txtAge").val();
			
			var data = {"action": "save","name":n,"city":c,"age":a};
		
			var settings= {
				type: "POST",
				dataType: "json",
				url: "api.php",
				data: data,
				success: function(response) {
					alert(response);					
				},
				error: function (err, type, httpStatus) {
					alert('error occurred');
				}
			};
			
			$.ajax(settings);
			console.log('request sent');
			return false;			
		});//end of save click
		
		$("#btnShow").click(function(){
		
			var data = {"action": "showall"};
		
			var settings= {
				type: "POST",
				dataType: "json",
				url: "api.php",
				data: data,
				success: function(response) {
					for(var ind=0;ind<response.data.length;ind++)
					{
						var row = response.data[ind];
						
						var $div = $("<div class='box'>");
						$div.append("ID:"+row.ID+" <br>");
						$div.append("Name:<a href='edit.php?id="+row.ID+"'>"+row.Name+"</a><br>");
						$div.append("City:"+row.City+"<br>");
						$div.append("Age:"+row.Age);
						
						$(".container").append($div);
						console.log(row);
						
					}
				},
				error: function (err, type, httpStatus) {
					alert('error occurred');
				}
			};
			
			$.ajax(settings);
			console.log('request sent');
			return false;			
		});//end of show all
		
	});//end of ready
</script>
</head>
<body>

<form  >
   
   Name:<input type="text" name="txtName" id="txtName" /> <br>
   City:<Select name="cmbCity" id="cmbCity">
		<option value="LHR">Lahore</option>
		<option value="KHI">Karachi</option>
		<option value="ISB">Islamabad</option>
		</select>
		<br>
   Age:<input type="text" name="txtAge" id="txtAge"/> 
   <br>
   <input type="submit" name="btnSave" id="btnSave" value="Save" />
   <br>
   <input type="submit" name="btnShow" id="btnShow" value="Show All Data" />
   
  <div class="container">
  </div>
</form>




</body>
</html>