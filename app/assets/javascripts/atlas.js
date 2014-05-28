window.Atlas = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  
  initialize: function(options) {
    Atlas.user = new Atlas.Models.User({ 'id': options.userId });
    Atlas.setNav(options.navEl); 
    Atlas.setConstants(options.data);

    Atlas.user.fetch({
      success: function() {
        new Atlas.Routers.ProfileRouter({
          rootEl: options.rootEl
        });
        Backbone.history.start()
        Atlas.user.potentials().fetch();
        Atlas.setProgress(options.progressEl);
      }
    });
  },
  
  setNav: function(el) {
    var newView = new Atlas.Views.Navbar();

    el.html(newView.render().$el);
  },
  
  setProgress: function(el) {
    var progressView = new Atlas.Views.Progress();
    el.html(progressView.render().$el);
  },

  setConstants: function(options) {
    Atlas.cities = options.cities;
    Atlas.industries = options.industries;
    Atlas.gradOptions = options.grad_options;
    Atlas.countries = options.countries;
    Atlas.jobInterests = options.job_interests;
    Atlas.videoChoices = options.video_choices;
  }
};