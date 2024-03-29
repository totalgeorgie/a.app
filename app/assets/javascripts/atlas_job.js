window.AtlasJob = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  
  initialize: function(options) {
    AtlasJob.job = new AtlasJob.Models.Job({ 'id': options.jobId });
    AtlasJob.setNav(options.navEl);
    AtlasJob.setConstants(options.data);

    AtlasJob.job.fetch({
      success: function() {
        new AtlasJob.Routers.JobRouter({
          rootEl: options.rootEl
        });
        AtlasJob.job.potentials().fetch();
        Backbone.history.start()
      }
    });
  },

  setConstants: function(data) {
    this.statusOptions = data.statusOptions;
  },

  setNav: function(el) {
    var navView = new AtlasJob.Views.Navbar();
    el.html(navView.render().$el);
  }
}