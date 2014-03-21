Atlas.Views.AboutView = Backbone.View.extend({
  events: {},
  template: JST["about_view"],

  render: function() {
    var content = this.template();

    this.$el.html(content);
    return this;
  }
})