AtlasJob.Collections.JobApps = Backbone.Collection.extend({
  url: function() {
    return Atlas.url() + 'admin/applications'
  },

  model: AtlasJob.Models.JobApp
});