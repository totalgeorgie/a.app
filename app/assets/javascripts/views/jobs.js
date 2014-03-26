Atlas.Views.JobsView = Backbone.View.extend({
  template: JST["jobs/show"],

  render: function() {
    var content = this.template({
      jobApps: Atlas.user.jobApps()
    });

    this.$el.html(content);
    return this;
  }
});