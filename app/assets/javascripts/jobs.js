jQuery(function($){
	$('.application_form').on('submit', function(event){
		debugger
		var $form = $(this);
		var num_questions = parseInt($form.find('#questions_count').val());
		
		for (var i = 0; i < num_questions; i++) {
			var video_uuid = $form.find('#' + i + "_video_uuid").val();
			if (!!video_uuid) {
				var $answer_uuid = $($form.find('#application_answers_attributes_' + i + '_video_uuid'));
				$answer_uuid.val(video_uuid);
			}
		};
	});
});