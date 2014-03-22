window.Atlas = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  setNav: function() {
    var newView = new Atlas.Views.Navbar();

    $('.top-navigation').html(newView.render().$el);
  },
  initialize: function(rootEl) {
    Atlas.setNav();  
    new Atlas.Routers.ProfileRouter({
      rootEl: rootEl
    });
    Backbone.history.start()
  }
};
