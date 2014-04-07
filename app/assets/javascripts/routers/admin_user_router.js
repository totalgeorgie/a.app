AtlasJob.Routers.JobRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.rootEl
  },

  routes: {
    "": "show"
  },

  all: function() {
    var userView = new AtlasJob.Views.UserShow();
    this._swapView(userView);
  },

  _swapView: function(view){
    if ( this._swap ) { this._swap.remove(); }
    this._swap = view;
    this.$rootEl.html(this._swap.render().$el);
  }
});