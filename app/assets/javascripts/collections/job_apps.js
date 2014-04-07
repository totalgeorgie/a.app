Atlas.Collections.JobApps = Backbone.Collection.extend({
  url: function() {
    return Atlas.url + "api/applications"
  },
  
  model: Atlas.Models.JobApp,

  initialize: function(models, options) {
    this.user = options.user;
  }
})