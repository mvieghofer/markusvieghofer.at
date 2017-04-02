/*
 * btf.js
 * Automatically and asynchronously load stylesheets, while
 * above the fold content has already been rendered.
 */
(function(){
	
	var atf, buff, max, totalLoaded = 0;
	
	atf = document.getElementById("atf");
	if (! atf ) {
		return false;
	}
	
	buff = atf.getAttribute("data-btf");
	buff = buff.split(";");
	
	max = buff.length;
	
	for ( var i = 0; i < max; i++ ) {
		if ( buff[i] !== "" ) {
			
			var link = document.createElement("link");
			link.rel = "stylesheet";
			link.href = buff[i];
			link.onload = function(){
				totalLoaded++;
				if ( totalLoaded >= max ) {
					atf.parentElement.removeChild(atf);
				}
			};
			
			document.head.appendChild(link);
			
			
		}
	}
	
	window.btf = this;
	
})(window);