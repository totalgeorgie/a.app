Atlas.Views.VideoView = Backbone.View.extend({
  template: JST["video/show"],
  
  initialize: function(options) {
    window.setTimeout(this.manageCamera.bind(this), 0);
  },

  publishVid: function(vid) {
    Atlas.user.video().set('video_uuid', vid.uuid).save();
    this.render();
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
    
    Backbone.View.prototype.remove.apply(this);
  },

  render: function() {
    var content = this.template({
      video: Atlas.user.video()
    });

    this.$el.html(content);
    return this;
  }
});