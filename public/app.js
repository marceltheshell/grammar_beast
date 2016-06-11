$( document ).ready(function() {
    console.log( "ready!" );

    function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : event.keyCode
	    if (charCode > 31 && (charCode < 48 || charCode > 57))
	        return false;
	    return true;
	}
	// so frustrating, I don't know why this app.js file is not being read by the DOM...
});

