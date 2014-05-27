Atlas.Views.Navbar = Backbone.View.extend({
  template: JST["nav"],
  
  render: function() {
    var content = this.template();
    this.$el.html(content);

    return this
  }
});