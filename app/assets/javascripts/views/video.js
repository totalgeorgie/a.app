Atlas.Views.VideoView = Backbone.AppView.extend({
  template: JST["video/show"],
  
  initialize: function(options) {
    window.setTimeout(this.manageCamera.bind(this), 0);
    this.user = Atlas.user
  },
  
  events: {
    'change .chosen-select' : 'alterVideoInfo'
  },

  publishVid: function(vid) {
    var that = this;
    Atlas.user.video().set('video_uuid', vid.uuid).save({}, {
      success: function() {
        that.refresh();
        that.trackVideo();
        Atlas.user.commonApp().fetch();
      }
    });
  },
  
  trackVideo: function() {
    _cio.track('video', {
      completed: true
    });
  },

  refresh: function() {
    this.render();
    CameraTag.setup();
  },

  manageCamera: function() {
    CameraTag.setup();
    CameraTag.observe('AtlasApp', 'published', this.publishVid.bind(this));
  },

  remove: function(){
    if (CameraTag.cameras.AtlasApp) {
      CameraTag.cameras.AtlasApp.destroy();
    }
  },

  render: function() {
    this.remove();
    var content = this.template({
      video: Atlas.user.video()
    });

    this.$el.html(content);
    window.setTimeout(this._addSelects.bind(this), 0);
    return this;
  }
});