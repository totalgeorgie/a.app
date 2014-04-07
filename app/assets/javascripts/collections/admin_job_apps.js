AtlasJob.Collections.JobApps = Backbone.Collection.extend({
  url: function() {
    return Atlas.url() + '/api/admin/applications'
  },

  model: AtlasJob.Models.JobApp
});