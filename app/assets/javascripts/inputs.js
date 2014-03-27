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
});