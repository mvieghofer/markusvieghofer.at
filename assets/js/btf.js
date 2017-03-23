/*
 * btf.js
 * Automatically and asynchronously load stylesheets, while
 * above the fold content has already been rendered.
 */
(function(){
	
	var atf, buff, i = 0, max, links = [], totalLoaded = 0;
	
	atf = document.getElementById("atf");
	if (! atf ) {
		return false;
	}
	
	buff = atf.getAttribute("data-btf");
	buff = buff.split(";");
	
	if ( buff.length < 2 ) {
		buff = buff;
	}
	
	max = buff.length;
	
	for ( i; i<max; i++ ) {
		if ( buff[i] !== "" ) {
			
			links[i] = document.createElement("link");
			links[i].rel = "stylesheet";
			links[i].href = buff[i];
			links[i].onload = function(){
				totalLoaded++;
				if ( totalLoaded >= (max -1) ) {
					atf.parentElement.removeChild(atf);
				}
			};
			
			document.head.appendChild(links[i]);
			
			
		}
	}
	
	window.btf = this;
	
})(window);