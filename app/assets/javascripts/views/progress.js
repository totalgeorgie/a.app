Atlas.Views.Progress = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
  },

  template: JST['progress'],

  render: function() {
    var content = this.template({
      user: this.model
    });

    this.$el.html(content);

    return this
  }
});