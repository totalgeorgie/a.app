Atlas.Routers.CommonAppRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.rootEl
  },

  routes: {
    "": "aboutMe",
    "on-china" : "onChina",
    "video" : "video"
  },

  aboutMe: function() {
    this.$rootEl.html('HELLO!');
  },

  onChina: function() {
    this.$rootEl.html('ON CHINA!');
  },

  video: function() {
    this.$rootEl.html('VIDEO!!');
  },

  _swapView: function(view){
    if ( this._swap ) {
      this._swap.remove();
    }
    this._swap = view;
    this.$rootEl.html(this._swap.render().$el);
  }

});