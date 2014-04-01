Atlas.Views.JobsView = Backbone.View.extend({
  template: JST["jobs/show"],

  initialize: function() {
    this.listenTo(Atlas.user.potentials(), "sync", this.render);
  },

  render: function() {
    var content = this.template({
      jobApps: Atlas.user.jobApps(),
      potentialJobs: Atlas.user.potentials()
    });
    this.$el.html(content);
    return this;
  }
});