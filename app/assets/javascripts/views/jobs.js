Atlas.Views.JobsView = Backbone.View.extend({
  template: JST["jobs/show"],
  potentials: JST["jobs/potentials"],

  render: function() {
    var content = this.template({
      jobApps: Atlas.user.jobApps()
    });
    
    var potentials = this.potentials({
      potentials: Atlas.user.potentials()
    });

    this.$el.html(content);
    return this;
  }
});