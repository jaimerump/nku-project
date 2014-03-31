/* Url utility functions not covered by jQuery */

function goTo(url){
	//Goes to given url
	window.location.href = url;	
}

function openInNew(url){
	//Opens given url in new tab/window. Only works when called from click
	window.open(url,'_blank');
}

function popitup(url) {
	newwindow=window.open(url,'name','height=420,width=550');
	if (window.focus) {newwindow.focus()}
	return false;
}
