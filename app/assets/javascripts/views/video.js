Atlas.Views.VideoView = Backbone.View.extend({
  template: JST["video/show"],
  initialize: function(options) {
    window.setTimeout(this.manageCamera.bind(this), 0);
  },

  publishVid: function(vid) {
    Atlas.user.video().set('video_uuid', vid.uuid).save()
  },
  
  refresh: function() {
    this.render();
    CameraTag.setup();
  },

  manageCamera: function() {
    CameraTag.setup();
    CameraTag.observe('AtlasApp', 'published', this.publishVid);
    CameraTag.observe('AtlasApp', 'processed', this.refresh);
  },

  remove: function(){
    CameraTag.cameras.AtlasApp.destroy();
    // _.each(CameraTag.cameras, function(camera){
    //   camera.destroy();
    // });
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