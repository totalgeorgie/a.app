jQuery(function($) {
	$.fn.editable.defaults.mode = 'inline';
    $('.editable').editable();
});

//toggle	string	'click'	
//How to toggle editable. Can be click|dblclick|mouseenter|manual.
//When set to manual you should manually call show/hide methods of editable.
//Note: if you call show or toggle inside click handler of some DOM element, you need to apply e.stopPropagation() because containers are being closed on any click on document.

//$('#edit-button').click(function(e) {
//    e.stopPropagation();
//    $('#username').editable('toggle');
//});