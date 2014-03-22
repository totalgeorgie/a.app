Atlas.Models.Job = Backbone.Model.extend({
  url: function() {
   return Atlas.url + "applications"  
  }
});