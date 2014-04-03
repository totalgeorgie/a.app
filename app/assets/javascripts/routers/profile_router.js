Atlas.Routers.ProfileRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.rootEl
  },

  routes: {
    "": "aboutMe",
    "career" : "career",
    "video" : "video",
    "jobs" : "jobs"
  },

  aboutMe: function() {
    var aboutView = new Atlas.Views.AboutView();

    this._swapView(aboutView);
    this._changeNav('.personal-info-nav');
  },

  career: function() {
    var careerView = new Atlas.Views.CareerView();

    this._swapView(careerView);
    this._changeNav('.career-nav');  
  },

  video: function() {
    var videoView = new Atlas.Views.VideoView();

    this._swapView(videoView);
    this._changeNav('.video-nav');
  },

  jobs: function() {
    var jobsView = new Atlas.Views.JobsView();

    this._swapView(jobsView);
    this._changeNav('.jobs-nav');  
  },

  _changeNav: function(selector) {
    $('.common-app-nav').find('a').removeClass('active');
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