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
	$('.editAdminNote').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.adminNote').editable('toggle');
	});
	$('.editSource').click(function(e){    
		   e.preventDefault();
	       e.stopPropagation();
	       $('.source').editable('toggle');
	});
	$('.profile_editable').on('save', function(e, params) {
		var progress_value = params.response.progress_value
		$('.progress_title').text("Your profile is " + progress_value + "% completed" )
		$('.bar').css('width', progress_value + '%');
	});

	$('.admin_editable').on('save', function(e, params) {
		var progress_value = params.response.progress_value
		var user_name = params.response.user_name
		$('.progress_title').text(user_name + "'s profile is " + progress_value + "% completed" )
		$('.bar').css('width', progress_value + '%');
	});
	
	$('#video_yes_no').bootstrapSwitch('setSizeClass', 'switch-large');

	$('#video_submit').on('click', function(e) {
		debugger
		e.preventDefault();
		$('dataVid').each(function(i, vid){
			var uuid = $(vid).find("." + vid.data('vid') + "_video_uuid").value;
			if (!!uuid) {

			};
		});
	});
});
