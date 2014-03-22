Atlas.Views.VideoView = Backbone.View.extend({
  template: JST["video/show"],

  render: function() {
    var content = this.template();

    this.$el.html(content);
    return this;
  }
});