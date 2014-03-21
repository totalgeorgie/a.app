Atlas.Views.Navbar = Backbone.View.extend({
  template: JST["nav"],

  events: {
    "click ul" : "runNav" 
  },

  runNav: function(e) {
    debugger
    var $ul = $(e.currentTarget);
    var $currentButton = $(e.target);
    $ul.find('a').removeClass("active");
    $currentButton.addClass("active");
  },

  render: function() {
    var content = this.template();

    this.$el.html(content);

    return this
  }
});