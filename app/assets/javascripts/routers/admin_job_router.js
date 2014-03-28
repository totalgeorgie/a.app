AtlasJob.Routers.JobRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.rootEl
  },

  routes: {
    "": "all",
    "/shotlisted" : "shortlisted"
  },

  all: function() {
    var allView = new Atlas.Views.allView();

    this._swapView(allView);
    this._changeNav('.all-nav');
  },

  shortlisted: function() {
    var onChinaView = new Atlas.Views.OnChinaView();

    this._swapView(onChinaView);
    this._changeNav('.on-china-nav');  
  },

  _changeNav: function(selector) {
    $('.candidate-opts').find('a').removeClass('active');
    $(selector).addClass('active')
  },

  _swapView: function(view){
    if ( this._swap ) {
      this._swap.remove();
    }
    this._swap = view;
    this.$rootEl.html(this._swap.render().$el);
  }
});