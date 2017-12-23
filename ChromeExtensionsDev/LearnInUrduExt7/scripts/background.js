


function check(tab_id,d,t)
{
		
	if(t.url.indexOf('learninginurdu') > -1){
	    chrome.pageAction.show(tab_id);
	}
}
	
chrome.tabs.onUpdated.addListener(check);



