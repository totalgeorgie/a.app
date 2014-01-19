jQuery(function($) {
	$.fn.editable.defaults.mode = 'inline';
    $('.editable').editable();

	$('.editCoverLetter').click(function(e){    
	       e.stopPropagation();
	       $('.coverLetter').editable('toggle');
	});

	$('.editCurrentCity').click(function(e){    
	       e.stopPropagation();
	       $('.currentCity').editable('toggle');
	});

	$('.editGradYear').click(function(e){    
	       e.stopPropagation();
	       $('.gradYear').editable('toggle');
	});

	$('.editTimeInChina').click(function(e){    
	       e.stopPropagation();
	       $('.timeInChina').editable('toggle');
	});

	$('.editReadType').click(function(e){    
	       e.stopPropagation();
	       $('.readType').editable('toggle');
	});

	$('.editListenSpeak').click(function(e){    
	       e.stopPropagation();
	       $('.listenSpeak').editable('toggle');
	});

	$('.editCity').click(function(e){    
	       e.stopPropagation();
	       $('.city').editable('toggle');
	});

	$('.editRole').click(function(e){    
	       e.stopPropagation();
	       $('.role').editable('toggle');
	});

	$('.editIndustry').click(function(e){    
	       e.stopPropagation();
	       $('.industry').editable('toggle');
	});

});



//toggle	string	'click'	
//How to toggle editable. Can be click|dblclick|mouseenter|manual.
//When set to manual you should manually call show/hide methods of editable.
//Note: if you call show or toggle inside click handler of some DOM element, you need to apply e.stopPropagation() because containers are being closed on any click on document.

//$('#edit-button').click(function(e) {
//    e.stopPropagation();
//    $('#username').editable('toggle');
//});