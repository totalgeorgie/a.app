$ ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'
  $('#video_question').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'
    disable_search_threshold: 10