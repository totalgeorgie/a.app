window.AtlasUser = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  
  initialize: function(options) {
    AtlasUser.user = new AtlasUser.Models.User({ 'id': options.userId });
    //AtlasUser.user.potentials().fetch();
    AtlasUser.user.fetch({
      success: function() {
        new AtlasUser.Routers.UserRouter({
          rootEl: options.rootEl
        });
        Backbone.history.start()
      }
    });
  }
}