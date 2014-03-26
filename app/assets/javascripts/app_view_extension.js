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
    debugger
    Atlas.user.commonApp().set(attr, value).save();

    this.fadeCheckmark($input);
  },

  fadeCheckmark: function(input) {
    var $span = input.parent().find('.glyphicon');
    $span.fadeOut();
    $span.fadeIn();
  }
});