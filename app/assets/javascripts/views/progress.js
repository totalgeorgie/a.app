Atlas.Views.Progress = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(Atlas.user, "sync", this.render);
    this.listenTo(Atlas.user.commonApp(), "sync", this.render);
    CameraTag.observe('AtlasApp', 'published', this.render.bind(this));
  },

  template: JST['progress'],

  render: function() {
    var content = this.template({
      user: Atlas.user
    });

    this.$el.html(content);

    return this
  }
});