Backbone.AppView = Backbone.View.extend({
  alterUserInfo: function(e) {
    var $input = $(e.target);
    var attr = $input.attr('name'),
        value = $input.val();

    Atlas.user.set(attr, value).save();

    this.fadeCheckmark($input);
  },

  alterCommonAppInfo: function(e) {
    var $input = $(e.target);
    var attr = $input.attr('name'),
        value = $input.val();

    Atlas.user.commonApp().set(attr, value).save();

    this.fadeCheckmark($input);
  },

  fadeCheckmark: function(input) {
    var $span = input.parent().find('.glyphicon');
    $span.fadeOut();
    $span.removeClass('no-show')
    $span.fadeIn();

  },
  
  _addSelects: function() {
    $('.chosen-select').chosen({
      allow_single_deselect: true,
      no_results_text: 'No results matched',
      width: '100%',
      disable_search_threshold: 3
    });
  },
});