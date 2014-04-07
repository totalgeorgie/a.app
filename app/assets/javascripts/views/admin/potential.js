AtlasJob.Views.Potential = Backbone.View.extend({
  template: JST['admin/jobs/potentials'],

  initialize: function(options) {
    this.listenTo(AtlasJob.job.potentials(), "sync", this.render);
  },

  render: function() {
    var content = this.template({
      users: AtlasJob.job.potentials()
    });

    this.$el.html(content);

    return this;
  }
});