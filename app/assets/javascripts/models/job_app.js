Atlas.Models.JobApp = Backbone.Model.extend({
  urlRoot: function() {
   return Atlas.url + "api/applications"  
  }
});