Atlas.Models.Video = Backbone.Model.extend({
  urlRoot: function() {
   return Atlas.url + "api/videos"  
  }
});