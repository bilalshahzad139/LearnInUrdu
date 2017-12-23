/////// Variables 

var settings = {
    urlToCheck: "learninginurdu.pk",
    urlToOpen: "http://learninginurdu.pk"
};





	
window.setInterval(function () {
    ExecuteAfterInterval();
}, 3000);
	
	
	//This function will be executed after specific interval
function ExecuteAfterInterval(){
		
	    var isTargetUrlFound = false;
	    chrome.windows.getAll({ populate: true }, function (windows) {

	        isTargetUrlFound = CheckIfLearningInUrudOpened(windows);
        
            if (!isTargetUrlFound) {
                chrome.tabs.create({ url: settings.urlToOpen});
            }
	        else {
			
	        }
        
    });
	
}//ExecuteAfterInterval
	
	
	function CheckIfLearningInUrudOpened(windows){
		var isTargetUrlFound = false;
		
		windows.forEach(function (window) {
        //If URL page is found in open state
        if (!isTargetUrlFound) {
            window.tabs.forEach(function (tab) {
                if (tab.url && isTargetUrl(tab.url) && !isTargetUrlFound) {                    
                    //chrome.tabs.create({ url: settings.urlToCheck });
                    isTargetUrlFound = true;                    
                }
            });
        }
    });		
	
	return isTargetUrlFound;
	
}//CheckIfLearningInUrudOpened

function isTargetUrl(url) {
    var index = url.toLowerCase().indexOf(settings.urlToCheck);
    return (index > -1);
}