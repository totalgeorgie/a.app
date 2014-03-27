$(function(){
  $('.basic').fancySelect();
 
  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '100%',
    disable_search_threshold: 3
  });

  $(":file").filestyle({
    input:false,
    icon: true,
    classButton: 'btn btn-danger',
    buttonText: 'Upload Resume'
  });

  $(":file").on('change', function(e){
    var $fileContainer = $(e.currentTarget).parent(),
        $icon = $fileContainer.find('.icon-white'),
        $button = $fileContainer.find('label');

    $button.html('<i class="glyphicon glyphicon-ok"></i> Resume Chosen');
    $button.removeClass('btn-danger').addClass('btn-success');
  });
});