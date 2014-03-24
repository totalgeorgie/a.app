Atlas.Routers.ProfileRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.rootEl
  },

  routes: {
    "": "aboutMe",
    "on-china" : "onChina",
    "video" : "video",
    "jobs" : "jobs"
  },

  aboutMe: function() {
    var aboutView = new Atlas.Views.AboutView();

    this._swapView(aboutView);
    this._addSelects();
    this._changeNav('.personal-info-nav');
  },

  onChina: function() {
    var onChinaView = new Atlas.Views.OnChinaView();

    this._swapView(onChinaView);
    this._addSelects();
    this._changeNav('.on-china-nav');  
  },

  video: function() {
    var videoView = new Atlas.Views.VideoView();

    this._swapView(videoView);
    this._addSelects();
    this._changeNav('.video-nav');  
    CameraTag.setup();
  },

  jobs: function() {
    var jobsView = new Atlas.Views.JobsView();

    this._swapView(jobsView);
    this._addSelects();
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
  },

  _addSelects: function() {
    $('.chosen-select').chosen({
      allow_single_deselect: true,
      no_results_text: 'No results matched',
      width: '100%',
      disable_search_threshold: 3
    });
  }

});