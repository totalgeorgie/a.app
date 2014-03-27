Atlas.Views.Progress = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(Atlas.user.commonApp(), "sync", this.render);
  },

  template: JST['progress'],

  calculateProgress: function() {
    return Atlas.user.commonApp().escape('progress');
  },

  render: function() {
    var content = this.template({
      progress: this.calculateProgress()
    });

    this.$el.html(content);

    return this
  }
});