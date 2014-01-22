jQuery(function($) {
	$.fn.editable.defaults.mode = 'inline';
	
    $('.editable').editable();

	$('.editCoverLetter').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.coverLetter').editable('toggle');
	});

	$('.editCurrentCity').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.currentCity').editable('toggle');
	});

	$('.editGradYear').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.gradYear').editable('toggle');
	});

	$('.editTimeInChina').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.timeInChina').editable('toggle');
	});

	$('.editReadType').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.readType').editable('toggle');
	});

	$('.editListenSpeak').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.listenSpeak').editable('toggle');
	});

	$('.editCity').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.city').editable('toggle');
	});

	$('.editRole').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.role').editable('toggle');
	});

	$('.editIndustry').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.industry').editable('toggle');
	});

});
