

		$(function(){
			$("#btnLoad").click(function(){
				LoadData();
				return false;
			});			
		});//End of DOM Ready function

		function LoadData(){
			var url = "https://jsonplaceholder.typicode.com/posts";
			
			var settings = {
				type : "GET",
				dataType : "json",
				url : url,
				data : "{}",
				success : function(result){
					DisplayMovies(result);
				},
				error : function(err){
					alert('error');					
				}
			};
			
			$.ajax(settings);
			
		}//LoadData
		
		function DisplayMovies(result){
			//chrome.browserAction.setBadgeText({text: count});
			var $container = $("#container").html("");
			
			for(var i=0;i<result.length;i++)
			{
				var obj = result[i];
				var $item = $("<div>").addClass("item");
				var $sp = $("<span>").text("ID:" + obj.id);
				$item.append($sp);
				$item.append("<br>");
				
				$sp = $("<span>").text("Title:" + obj.title);
				$item.append($sp);
				$item.append("<br>");
				
				$container.append($item);
			}			
		}//DisplayMovies