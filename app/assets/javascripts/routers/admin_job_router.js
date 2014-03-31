AtlasJob.Routers.JobRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.rootEl
  },

  routes: {
    "": "all",
    "shortlisted": "shortlisted",
    "potentials": "potentials"
  },

  all: function() {
    var allView = new AtlasJob.Views.Job({
      shortlisted: false
    });

    this._swapView(allView);
    this._changeNav('.all-nav');
  },

  shortlisted: function() {
    var shortView = new AtlasJob.Views.Job({
      shortlisted: true
    });

    this._swapView(shortView);
    this._changeNav('.short-list-nav');  
  },

  potentials: function() {
    var potView = new AtlasJob.Views.Potential();
    this._swapView(potView);
    this._changeNav('.potential-nav');
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