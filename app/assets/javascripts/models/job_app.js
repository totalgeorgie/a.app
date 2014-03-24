Atlas.Models.JobApp = Backbone.Model.extend({
  url: function() {
   return Atlas.url + "applications"  
  }
});